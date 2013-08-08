module Social
	module Posts
		module UniversalAttributes
			
			extend ActiveSupport::Concern
			
			included do
				attr_accessible :published_at, :address
			end
			
		end
	end
end