module Social
	class Post < ActiveRecord::Base
	
		attr_accessible :post, :published_at
		
		default_scope { includes(:post) }
		default_scope { order('published_at DESC') }
		belongs_to :post, polymorphic: true
		
		def network
			self.post.class.network
		end
		
		def photo
			self.post.post.photo if defined?(self.post.post.photo)
			self.post.photo if defined?(self.post.photo)
			false
		end
		
		def self.import
			Posts::Facebook.import
			Posts::Tweet.import
			Posts::Instagram.import
		end
		
	end
end
