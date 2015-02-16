# == Schema Information
#
# Table name: facebook_posts
#
#  id             :integer          not null, primary key
#  page_id        :integer
#  upcode         :string           not null
#  message        :text
#  type           :string
#  created_time   :datetime         not null
#  updated_time   :datetime         not null
#  extra          :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  comments_count :integer
#  likes_count    :integer
#  shares_count   :integer
#  link           :string
#

class FacebookPost < ActiveRecord::Base
  belongs_to :page, class_name: FacebookPage, foreign_key: "page_id"
  has_many :trackings, class_name: FacebookPostTracking, foreign_key: "post_id", autosave: true

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

    self.posted_at     = data["created_time"]
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
