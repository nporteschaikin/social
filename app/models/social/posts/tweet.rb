module Social
	module Posts
		class Tweet < ActiveRecord::Base

			validates :tid, presence: true
			validates :tweet, presence: true
			
			attr_accessor :published_at
			
			after_save do
				Social::Post.create post: self, published_at: self.published_at
			end

			def self.import
				client = Twitter::Client.new consumer_key: Social::Engine.config.twitter_consumer_key, consumer_secret: Social::Engine.config.twitter_consumer_secret
				tweets = client.user_timeline Social::Engine.config.twitter_username
				tweets.each do |tweet|
					self.find_or_create_by(tid: tweet.id) { |p| p.tweet = tweet.text; p.published_at = tweet.created_at }
				end
			end

		end
	end
end
