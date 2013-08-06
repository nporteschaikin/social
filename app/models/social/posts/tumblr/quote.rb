module Social
	module Posts
		module Tumblr
			class Quote < ActiveRecord::Base
				
				def snippet; self.body; end
				
				attr_accessible :body, :source
				
			end
		end
	end
end
