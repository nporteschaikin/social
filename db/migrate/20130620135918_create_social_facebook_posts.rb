class CreateSocialFacebookPosts < ActiveRecord::Migration
  def change
    create_table :social_facebook_posts do |t|
      t.string :fid
      t.references :post, index: true, polymorphic: true

      t.timestamps
    end
  end
end
