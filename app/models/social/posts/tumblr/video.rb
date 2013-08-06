module Social
	module Posts
		module Tumblr
			class Video < ActiveRecord::Base
				
				attr_accessible :embed
				
			end
		end
	end
end
