module Social
	module Posts
		module Create
			
			extend ActiveSupport::Concern
			
			included do
			  has_one :parent, as: :post, class_name: "Social::Post"
			  default_scope { select("#{self.table_name}.*, social_posts.published_at, social_posts.address").joins(:parent) }
			  attr_accessor :tags_found
    		
				after_create do
					Social::Post.create post: self, published_at: self.published_at, address: self.address, tags_found: self.tags_found
				end
			end
			
		end
	end
end