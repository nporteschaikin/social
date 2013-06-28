class AddAddressToSocialPosts < ActiveRecord::Migration
  def change
    add_column :social_posts, :address, :string
  end
end
