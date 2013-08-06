module Social
	module Posts
		module Tumblr
			class Link < ActiveRecord::Base
				
				def snippet; self.description; end
				
				attr_accessible :title, :url, :description
				
			end
		end
	end
end
