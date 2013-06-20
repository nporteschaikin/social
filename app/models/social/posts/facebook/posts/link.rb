module Social
	module Posts
		module Facebook
			module Posts
				class Link < ActiveRecord::Base

					has_attached_file :icon # todo: add styles and validators
					validates :link, presence: true # todo: change to regex validations

				end
			end
		end
	end
end
