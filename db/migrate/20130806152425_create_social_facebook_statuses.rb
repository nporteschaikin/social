class CreateSocialFacebookStatuses < ActiveRecord::Migration
  def change
    create_table :social_facebook_statuses do |t|
      t.text :message
      t.timestamps
    end
  end
end
