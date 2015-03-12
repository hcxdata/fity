class AddPlayerUrlToYoutubeVideos < ActiveRecord::Migration
  def change
    change_table :youtube_videos do |t|
      t.string :player_url
    end
  end
end
