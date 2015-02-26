class AddAvatarToTwitterUsers < ActiveRecord::Migration
  def change
    change_table :twitter_users do |t|
      t.string :avatar
    end
  end
end
