class RenameYoutubeVideoColumn < ActiveRecord::Migration
  def change
    rename_column :youtube_videos, :unique_id, :upcode
  end
end
