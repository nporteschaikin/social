module Social
	module Posts
		module Facebook
			module Posts
				class Photo < ActiveRecord::Base
					
					has_attached_file :photo # todo: add styles and validators

				end
			end
		end
	end
end
