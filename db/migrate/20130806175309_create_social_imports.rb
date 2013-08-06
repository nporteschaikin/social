class CreateSocialImports < ActiveRecord::Migration
  def change
    create_table :social_imports do |t|
      t.datetime :created_at
      t.string :networks
    end
  end
end
