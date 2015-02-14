class AddLinkToFacebookPosts < ActiveRecord::Migration
  def change
    add_column :facebook_posts, :link, :string
  end
end
