module Social
  module Facebook
	
		def self.table_name_prefix
			'social_facebook_'
		end
		
		def self.import
			
			# connect to API
			api = Koala::Facebook::API.new Social::Engine.config.facebook_token
			
			# get posts
			posts = api.get_connections Social::Engine.config.facebook_page, "posts"
			
			# loop and create
			posts.each do |post|
				create = Facebook::Post.find_or_create_by(fid: post['id']) { |p| p.object = OpenStruct.new(post) }
			end
			
		end
		

  end
end
