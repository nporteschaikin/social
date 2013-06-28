module Social
	module Posts
		module Create
			
			extend ActiveSupport::Concern
			
			included do
				attr_accessor :published_at, :address
				after_save do
					Social::Post.create post: self, published_at: self.published_at, address: self.address
				end
			end
			
		end
	end
end