module Social
	module Posts
		module Facebook
			module Posts
				class Status < ActiveRecord::Base

					has_attached_file :icon
					validates :message, presence: true

				end
			end
		end
	end
end
