module Social
	class Facebook::Photo < ActiveRecord::Base
	
		has_attached_file :photo # todo: add styles and validators
	
	end
end
