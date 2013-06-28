class CreateSocialPosts < ActiveRecord::Migration
  def change
    create_table :social_posts do |t|
      t.references :post, index: true, polymorphic: true
      t.datetime :published_at
      t.string :address
    end
  end
end
