module Social
	class Facebook::Post < ActiveRecord::Base
		
		belongs_to :post, polymorphic: true
		attr_accessor :object
		
		before_validation do
			
			case object.type
				when "status"
					self.post = Facebook::Status.create message: object.message
				when "photo"
					self.post = Facebook::Photo.create photo: URI.parse(object.picture), caption: object.message
				when "link"
					self.post = Facebook::Link.create link: object.link, icon: URI.parse(object.icon), message: object.message
				else
					return false
			end
				
		end 
		
	end
end
