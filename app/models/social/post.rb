module Social
	class Post < ActiveRecord::Base
	
		attr_accessible :post, :published_at, :address
		
		default_scope { includes(:post) }
		default_scope { order('published_at DESC') }
		belongs_to :post, polymorphic: true
		
		def network; self.post.class.network; end
		def snippet; self.post.snippet; end
		
		def photo
			return self.post.post.photo if defined?(self.post.post.photo)
			return self.post.photo if defined?(self.post.photo)
		end
		
	end
end
