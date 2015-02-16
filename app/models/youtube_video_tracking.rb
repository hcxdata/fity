class YoutubeVideoTracking < ActiveRecord::Base
  belongs_to :video, class_name: YoutubeVideo, foreign_key: "video_id"
end
