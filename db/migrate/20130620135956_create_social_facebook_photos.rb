class CreateSocialFacebookPhotos < ActiveRecord::Migration
  def change
    create_table :social_facebook_photos do |t|
      t.attachment :photo
      t.text :caption

      t.timestamps
    end
  end
end
