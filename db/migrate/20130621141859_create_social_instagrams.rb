class CreateSocialInstagrams < ActiveRecord::Migration
  def change
    create_table :social_instagrams do |t|
      t.string :iid
      t.attachment :photo
    end
  end
end
