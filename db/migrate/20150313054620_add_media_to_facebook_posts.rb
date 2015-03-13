class AddMediaToFacebookPosts < ActiveRecord::Migration
  def change
    change_table :facebook_posts do |t|
      t.string :media
    end
  end
end
