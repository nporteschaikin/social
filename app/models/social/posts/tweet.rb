module Social
	module Posts
		class Tweet < ActiveRecord::Base
			
			attr_accessible :tweet_id, :tweet
			
			validates :tweet_id, presence: true
			validates :tweet, presence: true
			
			include Social::Posts::UniversalAttributes
			include Social::Posts::Create
			
			def snippet; self.tweet; end
			
			class << self
				
				def network; "Twitter"; end
				
				def import
					if Social::Engine.config.twitter_enabled
						client = Twitter::Client.new consumer_key: Social::Engine.config.twitter_consumer_key, consumer_secret: Social::Engine.config.twitter_consumer_secret
						tweets = client.user_timeline Social::Engine.config.twitter_username
						tweets.each do |tweet|
							self.find_or_create_by_tweet_id(tweet.id) { |p| p.tweet = tweet.text; p.published_at = tweet.created_at; p.address = "http://www.twitter.com/#{tweet.user.screen_name}/status/#{tweet.id}" }
						end
					else
						return false
					end
				end
				
			end
		
		end
	end
end
