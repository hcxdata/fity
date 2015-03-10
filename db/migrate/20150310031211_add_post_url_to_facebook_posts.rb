class AddPostUrlToFacebookPosts < ActiveRecord::Migration
  def change
    change_table :facebook_posts do |t|
      t.string :post_url
    end
  end
end
