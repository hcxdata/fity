# == Schema Information
#
# Table name: instagram_media
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  upcode         :string
#  type           :string
#  link           :string
#  caption_id     :string
#  created_time   :string
#  likes_count    :integer
#  comments_count :integer
#  caption_text   :text
#  extra          :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class InstagramMedium < ActiveRecord::Base
  self.inheritance_column = "_type"
  store :extra, coder: JSON
  mount_uploader :media, MediaUploader

  belongs_to :user, class_name: InstagramUser
  has_many :trackings, class_name: InstagramMediumTracking, foreign_key: "medium_id", autosave: true

  after_create :async_download_media

  def async_download_media
    InstagramMediumMediaWorker.perform_async(id)
  end

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
