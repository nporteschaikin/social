class CreateSocialTags < ActiveRecord::Migration
  def change
    create_table :social_tags do |t|
      t.string :name

      t.timestamps
    end
  end
end
