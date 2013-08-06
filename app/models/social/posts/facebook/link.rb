module Social
	module Posts
		module Facebook
			class Link < ActiveRecord::Base
				
				attr_accessible :link, :icon
				
				def snippet; self.message; end
				has_attached_file :icon # todo: add styles and validators
				validates :link, presence: true # todo: change to regex validations
				
			end
		end
	end
end
