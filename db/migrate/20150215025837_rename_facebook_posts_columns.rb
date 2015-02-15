class RenameFacebookPostsColumns < ActiveRecord::Migration
  def change
    change_table :facebook_posts do |t|
      t.rename :comment_count, :comments_count
      t.rename :share_count, :shares_count
      t.rename :like_count, :likes_count
      t.change :message, :text
    end
  end
end
