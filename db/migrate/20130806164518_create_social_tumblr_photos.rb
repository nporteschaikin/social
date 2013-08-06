class CreateSocialTumblrPhotos < ActiveRecord::Migration
  def change
    create_table :social_tumblr_photos do |t|
      t.attachment :photo
      t.text :caption
    end
  end
end
