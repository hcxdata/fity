class RenameMediaFollowsFollowedBy < ActiveRecord::Migration
  def change
    rename_column :instagram_users, :media, :media_count
    rename_column :instagram_users, :follows, :follows_count
    rename_column :instagram_users, :followed_by, :followed_by_count
  end
end
