class InstagramMedium < ActiveRecord::Base
  
  belongs_to :user, class_name: InstagramUser
  has_many :trackings, class_name: InstagramMediumTracking, foreign_key: "medium_id", autosave: true

  def sync!(data)
    data.extend Hashie::Extensions::DeepFetch

    self.extra = data.to_h
    self.upcode = data["id"]
    self.caption_id =  data.deep_fetch("caption", "id") { "" }
    self.caption_text =  data.deep_fetch("caption", "text") { "" }

    self.likes_count =  data.deep_fetch("likes", "count") { 0 }
    self.comments_count =  data.deep_fetch("comments", "count") { 0 }

    self.attributes = data.slice("type", "link", "created_time")
    build_tracking
    save!
  end

  def build_tracking
    trackings.build(recording_at: Time.current, likes_count: likes_count, comments_count: comments_count)
  end

end
