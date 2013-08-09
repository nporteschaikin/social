module Social
	module Posts
		module Tumblr
			class Text < ActiveRecord::Base
				
				def snippet; self.body; end
				
				attr_accessible :title, :body
				
				include Social::Posts::ImageRelationship
				
				after_create do
					
					Nokogiri::HTML.fragment(self.body).css("img").each do |image|
						self.images.create asset: URI.parse(image.attribute('src').value)
					end
					
				end
				
			end
		end
	end
end
