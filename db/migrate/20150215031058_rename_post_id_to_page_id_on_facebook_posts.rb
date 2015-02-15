class RenamePostIdToPageIdOnFacebookPosts < ActiveRecord::Migration
  def change
    change_table :facebook_posts do |t|
      t.rename :post_id, :page_id
    end
  end
end
