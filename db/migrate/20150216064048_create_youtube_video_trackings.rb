class CreateYoutubeVideoTrackings < ActiveRecord::Migration
  def change
    create_table :youtube_video_trackings do |t|
      t.belongs_to :video, index: true
      t.datetime :recording_at

      t.integer :comment_count
      t.integer :favorite_count
      t.integer :view_count

      t.timestamps null: false
    end
  end
end
