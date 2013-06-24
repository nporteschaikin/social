class CreateSocialFacebookLinks < ActiveRecord::Migration
  def change
    create_table :social_facebook_links do |t|
      t.string :link
      t.attachment :icon
      t.text :message
    end
  end
end
