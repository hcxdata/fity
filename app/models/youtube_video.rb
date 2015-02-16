class YoutubeVideo < ActiveRecord::Base
  belongs_to :user, class_name: YoutubeUser, foreign_key: "user_id"

  def sync(data)
    self.extra = data.to_h
    self.attributes = data.slice("unique_id", "title", "favorite_count", "view_count", "published_at", "description", "extra")
    save
  end
end
