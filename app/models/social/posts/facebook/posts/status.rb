module Social
	module Posts
		module Facebook
			module Posts
				class Status < ActiveRecord::Base
					
					def snippet; self.message; end
					attr_accessible :message, :icon
					
					has_attached_file :icon
					validates :message, presence: true

				end
			end
		end
	end
end
