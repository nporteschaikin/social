module Social
	module Posts
		module Tumblr
			class Video < ActiveRecord::Base
				
				attr_accessible :embed
				def snippet; nil; end
				
			end
		end
	end
end
