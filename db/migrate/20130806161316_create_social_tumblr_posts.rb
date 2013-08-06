class CreateSocialTumblrPosts < ActiveRecord::Migration
  def change
    create_table :social_tumblr_posts do |t|
      t.string :tumblr_id
      t.references :post, index: true, polymorphic: true

      t.timestamps
    end
  end
end
