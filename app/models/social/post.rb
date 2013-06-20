module Social
	class Post < ActiveRecord::Base
	
		belongs_to :post, polymorphic: true

	end
end
