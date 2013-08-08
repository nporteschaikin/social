class CreateSocialFacebookPosts < ActiveRecord::Migration
  def change
    create_table :social_facebook_posts do |t|
      t.string :facebook_id
      t.references :post, index: true, polymorphic: true
      t.datetime :published_at
      t.string :address
    end
  end
end
