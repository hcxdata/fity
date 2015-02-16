class YoutubeVideo < ActiveRecord::Base
  belongs_to :user, class_name: YoutubeUser, foreign_key: "user_id"
  has_many :trackings, class_name: YoutubeVideoTracking, foreign_key: "video_id", autosave: true

  def sync(data)
    self.extra = data.to_h
    self.attributes = data.slice("unique_id", "title", "favorite_count", "view_count", "published_at", "description", "extra")
    build_tracking
    save
  end

  def build_tracking
    trackings.build(recording_at: Time.current, comment_count: comment_count, favorite_count: favorite_count, view_count: view_count)
  end
end
