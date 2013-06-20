module Social
	class Facebook::Status < ActiveRecord::Base
		
		has_attached_file :icon
		validates :message, presence: true
		
	end
end
