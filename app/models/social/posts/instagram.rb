module Social
	module Posts
		class Instagram < ActiveRecord::Base
			
				validates :iid, presence: true
				has_attached_file :photo
				
				include Social::Posts::Create

				def self.import
					client = Social::Engine::Instagram::Client.new client_id: Social::Engine.config.instagram_client_id, client_secret: Social::Engine.config.instagram_client_secret, access_token: Social::Engine.config.instagram_access_token
					uid = client.user_search(Social::Engine.config.instagram_username).first.id
					photos = client.user_recent_media(uid)
					photos.each do |photo|
						self.find_or_create_by(iid: photo.id) { |p| p.photo = URI.parse(photo.images.standard_resolution.url); p.published_at = Time.at(Integer(photo.created_time)) }
					end
					photos.first
				end

		end
	end
end
