class CreateSocialTumblrTexts < ActiveRecord::Migration
  def change
    create_table :social_tumblr_texts do |t|
      t.text :body
      t.string :title
      t.string :more
    end
  end
end
