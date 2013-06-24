module Social
	class Post < ActiveRecord::Base
	
		default_scope { includes(:post) }
		default_scope { order('published_at DESC') }
		belongs_to :post, polymorphic: true
		
		def self.import
			Posts::Facebook.import
			Posts::Tweet.import
			Posts::Instagram.import
		end
		
	end
end
