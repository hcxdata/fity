class AddCommentLikeShareCountToFacebookPosts < ActiveRecord::Migration
  def change
    add_column :facebook_posts, :comment_count, :int
    add_column :facebook_posts, :like_count, :int
    add_column :facebook_posts, :share_count, :int
  end
end
