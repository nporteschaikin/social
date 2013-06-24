module Social
	module Posts
		module Facebook

			def self.table_name_prefix
				'social_facebook_'
			end

			def self.import
				api = Koala::Facebook::API.new(Koala::Facebook::OAuth.new(Social::Engine.config.facebook_app_id, Social::Engine.config.facebook_app_secret).get_app_access_token)
				posts = api.get_connections(Social::Engine.config.facebook_page, "posts")
				posts.each do |post|
					create = Facebook::Post.find_or_create_by_facebook_id(post['id']) { |p| p.object = OpenStruct.new(post) }
				end
			end

		end
	end
end
