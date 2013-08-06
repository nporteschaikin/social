module Social
	module Posts
		class FacebookPost < ActiveRecord::Base

			attr_accessible :facebook_id

			default_scope { includes(:post) }
			belongs_to :post, polymorphic: true
			validates :facebook_id, presence: true
			attr_accessor :object, :api

			include Social::Posts::Create

			def snippet; self.post.snippet; end

			before_validation do
				case object['type']
				when "status"
					return false if object['message'].nil?
					self.post = Social::Posts::Facebook::Status.create message: object['message']
				when "photo"
					self.post = Social::Posts::Facebook::Photo.create photo: URI.parse(api.get_object(object['object_id'])['source']), caption: object['message']
				when "link"
					self.post = Social::Posts::Facebook::Link.create link: object['link'], icon: URI.parse(object['icon']), message: object['message']
				else
					return false
				end
				self.address = object['link']
				self.published_at = object['created_time']
			end
			
			class << self
				
				def network; "Facebook"; end
				
				def import
					if Social::Engine.config.facebook_enabled
						api = Koala::Facebook::API.new(Koala::Facebook::OAuth.new(Social::Engine.config.facebook_app_id, Social::Engine.config.facebook_app_secret).get_app_access_token)
						posts = api.get_connections(Social::Engine.config.facebook_page, "posts")
						posts.each do |post|
							self.find_or_create_by_facebook_id(post['id']) { |p| p.object = post; p.api = api }
						end
					else
						return false
					end
				end
				
			end
		
		end
	end
end
