class CreateSocialImages < ActiveRecord::Migration
  def change
    create_table :social_images do |t|
      t.references :parent, index: true, polymorphic: true
      t.attachment :asset
    end
  end
end
