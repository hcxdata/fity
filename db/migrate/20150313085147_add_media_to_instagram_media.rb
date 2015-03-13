class AddMediaToInstagramMedia < ActiveRecord::Migration
  def change
    change_table :instagram_media do |t|
      t.string :media
    end
  end
end
