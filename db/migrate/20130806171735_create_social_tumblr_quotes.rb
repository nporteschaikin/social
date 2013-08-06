class CreateSocialTumblrQuotes < ActiveRecord::Migration
  def change
    create_table :social_tumblr_quotes do |t|
      t.text :body
      t.string :source
    end
  end
end
