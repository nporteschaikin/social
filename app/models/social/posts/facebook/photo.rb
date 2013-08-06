module Social
	module Posts
		module Facebook
			class Photo < ActiveRecord::Base
				
				def snippet; self.caption; end
				attr_accessible :photo, :caption
				has_attached_file :photo # todo: add styles and validators
				
			end
		end
	end
end
