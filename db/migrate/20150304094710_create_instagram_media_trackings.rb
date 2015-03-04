class CreateInstagramMediaTrackings < ActiveRecord::Migration
  def change
    create_table :instagram_media_trackings do |t|

      t.belongs_to :media, index: true
      t.datetime :recording_at

      t.integer :likes_count
      t.integer :comments_count

      t.timestamps null: false
    end
  end
end
