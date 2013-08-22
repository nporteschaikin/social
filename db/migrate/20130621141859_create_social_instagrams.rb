class CreateSocialInstagrams < ActiveRecord::Migration
  def change
    create_table :social_instagrams do |t|
      t.string :instagram_id
      t.text :caption
      t.attachment :photo
    end
  end
end
