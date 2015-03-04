class RenameMediaIdToMediumId < ActiveRecord::Migration
  def change
      rename_column :instagram_medium_trackings, :media_id, :medium_id
  end
end
