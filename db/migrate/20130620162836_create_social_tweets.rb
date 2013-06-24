class CreateSocialTweets < ActiveRecord::Migration
  def change
    create_table :social_tweets do |t|
      t.string :tid
      t.text :tweet
    end
  end
end
