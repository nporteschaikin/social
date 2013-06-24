module Social
	module Posts
		module Facebook
			class Post < ActiveRecord::Base
				
				default_scope { includes(:post) }
				belongs_to :post, polymorphic: true
				validates :fid, presence: true
				attr_accessor :object
				
				include Social::Posts::Create
				
				before_validation do
					
					case object.type
						when "status"
							return false if object.message.nil?
							self.post = Facebook::Posts::Status.create message: object.message
						when "photo"
							self.post = Facebook::Posts::Photo.create photo: URI.parse(object.picture), caption: object.message
						when "link"
							self.post = Facebook::Posts::Link.create link: object.link, icon: URI.parse(object.icon), message: object.message
						else
							return false
					end
					self.published_at = object.created_time
					
				end
				
			end
		end
	end
end
