# == Schema Information
#
# Table name: youtube_video_trackings
#
#  id             :integer          not null, primary key
#  video_id       :integer
#  recording_at   :datetime
#  comment_count  :integer
#  favorite_count :integer
#  view_count     :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class YoutubeVideoTracking < ActiveRecord::Base
  belongs_to :video, class_name: YoutubeVideo, foreign_key: "video_id"
end
