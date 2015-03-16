class AddMediaToYoutubeVideos < ActiveRecord::Migration
  def change
    change_table :youtube_videos do |t|
      t.string :media
    end
  end
end
