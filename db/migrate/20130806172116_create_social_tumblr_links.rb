class CreateSocialTumblrLinks < ActiveRecord::Migration
  def change
    create_table :social_tumblr_links do |t|
      t.string :url
      t.string :description
      t.string :title
    end
  end
end
