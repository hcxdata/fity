# == Schema Information
#
# Table name: facebook_posts
#
#  id             :integer          not null, primary key
#  page_id        :integer
#  upcode         :string
#  posted_at      :datetime
#  message        :text
#  link           :string
#  comments_count :integer
#  likes_count    :integer
#  shares_count   :integer
#  extra          :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  post_url       :string
#

class FacebookPost < ActiveRecord::Base
  store :extra, coder: JSON
  mount_uploader :media, MediaUploader

  belongs_to :page, class_name: FacebookPage, foreign_key: "page_id"
  has_many :trackings, class_name: FacebookPostTracking, foreign_key: "post_id", autosave: true

  after_create :async_download_media

  def async_download_media
    FacebookPostMediaWorker.perform_async(id)
  end

  API_FIELDS = %w(
    id
    message
    picture
    link
    name
    caption
    description
    icon
    created_time
    updated_time
    shares
    likes.summary(true)
    comments.summary(true)
  )

  def sync!(data)
    data.extend Hashie::Extensions::DeepFetch
    self.extra = data.to_h

    self.post_url = "https://www.facebook.com/#{data['id'].gsub('_', '/posts/')}"
    self.posted_at = data["created_time"]
    self.likes_count    = data.deep_fetch("likes", "summary", "total_count") { 0 }
    self.comments_count = data.deep_fetch("comments", "summary", "total_count") { 0 }
    self.shares_count   = data.deep_fetch("shares", "count") { 0 }
    self.attributes = data.slice("message", "link")
    build_tracking
    save!
  end

  def build_tracking
    trackings.build(recording_at: Time.current, likes_count: likes_count, comments_count: comments_count, shares_count: shares_count)
  end
end
