module Social
	class Post < ActiveRecord::Base
	
		default_scope { includes(:post) }
		
		belongs_to :post, polymorphic: true
		
	end
end
