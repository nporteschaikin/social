module Social
	module Posts
		class Tweet < ActiveRecord::Base
			
			attr_accessible :tweet_id, :tweet
			
			validates :tweet_id, presence: true
			validates :tweet, presence: true
			
			include Social::Posts::Create

			def self.import
				if Social::Engine.config.twitter_enabled
					tweets = Twitter.user_timeline Social::Engine.config.twitter_username
					tweets.each do |tweet|
						self.find_or_create_by_tweet_id(tweet.id) { |p| p.tweet = tweet.text; p.published_at = tweet.created_at }
					end
				else
					return false
				end
			end

		end
	end
end
