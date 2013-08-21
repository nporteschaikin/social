module Social
	module Posts
		class TumblrPost < ActiveRecord::Base

			attr_accessible :tumblr_id, :object
			attr_accessor :object

			default_scope { includes(:post) }
			belongs_to :post, polymorphic: true
			validates :tumblr_id, presence: true
			validates :post, presence: true

			include Social::Posts::UniversalAttributes
			include Social::Posts::Create
			
			def snippet; self.post.snippet; end
			
			before_validation do
			  self.post.destroy if self.post
			  puts object
				case object["type"]
				when "photo"
					self.post = Social::Posts::Tumblr::Photo.create photo: URI.parse(object["photos"].first["original_size"]["url"]), caption: object['caption']
				when "text"
					self.post = Social::Posts::Tumblr::Text.create body: object["body"], title: object["title"]
				when "quote"
					self.post = Social::Posts::Tumblr::Quote.create body: object["text"], source: object["source"]
				when "link"
					self.post = Social::Posts::Tumblr::Link.create title: object["title"], url: object["url"], description: object["description"]
				when "video"
					self.post = Social::Posts::Tumblr::Video.create embed: object["player"].first["embed_code"]
				end
				self.address = object["post_url"]
				self.published_at = object["date"]
			end
			
			
			class << self
				
				def network; "Tumblr"; end
				
				def update_or_create(object)
          obj = self.find_by_tumblr_id object["id"]
          obj.nil? ? self.create(tumblr_id: object["id"], object: object) : obj.update_attributes(object: object)
  			end
  			
				def import
					if Social::Engine.config.tumblr_enabled
						client = Social::Engine::Tumblr::Client.new consumer_key: Social::Engine.config.tumblr_consumer_key
						posts = client.posts(Social::Engine.config.tumblr_address)["posts"]
						posts.each {|post| self.update_or_create(post) }
					else
						return false
					end
				end
				
			end

		end
	end
end
