class RenameInstagramMediaTrackings < ActiveRecord::Migration
  def change
    rename_table :instagram_media_trackings, :instagram_medium_trackings
  end
end
