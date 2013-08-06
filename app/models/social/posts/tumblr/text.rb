module Social
	module Posts
		module Tumblr
			class Text < ActiveRecord::Base
				
				def snippet; self.body; end
				
				attr_accessible :title, :body
				
			end
		end
	end
end
