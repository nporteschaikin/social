class CreateSocialTweets < ActiveRecord::Migration
  def change
    create_table :social_tweets do |t|
      t.string :tweet_id
      t.text :tweet
      t.datetime :published_at
      t.string :address
    end
  end
end
