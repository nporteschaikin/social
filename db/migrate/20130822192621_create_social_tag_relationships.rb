class CreateSocialTagRelationships < ActiveRecord::Migration
  def change
    create_table :social_tag_relationships do |t|
      t.references :post, index: true
      t.references :tag, index: true
    end
  end
end
