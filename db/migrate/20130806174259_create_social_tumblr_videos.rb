class CreateSocialTumblrVideos < ActiveRecord::Migration
  def change
    create_table :social_tumblr_videos do |t|
      t.text :embed
    end
  end
end
