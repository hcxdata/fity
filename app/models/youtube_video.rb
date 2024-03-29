# == Schema Information
#
# Table name: youtube_videos
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  upcode         :string
#  title          :string
#  comment_count  :integer
#  favorite_count :integer
#  view_count     :integer
#  published_at   :string
#  description    :text
#  extra          :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  player_url     :string
#

class YoutubeVideo < ActiveRecord::Base
  mount_uploader :media, MediaUploader
  
  belongs_to :user, class_name: YoutubeUser, foreign_key: "user_id"
  has_many :trackings, class_name: YoutubeVideoTracking, foreign_key: "video_id", autosave: true

  after_create :async_download_media

  def async_download_media
    YoutubeVideoMediaWorker.perform_async(id)
  end

  def sync!(data)
    self.extra = data.to_h
    self.attributes = data.slice("title", "favorite_count", "view_count", "published_at", "description", "extra", "player_url")
    build_tracking
    save!
  end

  def build_tracking
    trackings.build(recording_at: Time.current, comment_count: comment_count, favorite_count: favorite_count, view_count: view_count)
  end
end
