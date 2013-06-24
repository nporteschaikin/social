module Social
	module Posts
		module Create
			
			extend ActiveSupport::Concern
			
			included do
				attr_accessor :published_at
				after_save do
					Social::Post.create post: self, published_at: self.published_at
				end
			end
			
		end
	end
end