class CreateSocialFacebookStatuses < ActiveRecord::Migration
  def change
    create_table :social_facebook_statuses do |t|
      t.text :message
    end
  end
end
