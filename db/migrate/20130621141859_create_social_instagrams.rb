class CreateSocialInstagrams < ActiveRecord::Migration
  def change
    create_table :social_instagrams do |t|
      t.string :instagram_id
      t.text :caption
      t.attachment :photo
      t.datetime :published_at
      t.string :address
    end
  end
end
