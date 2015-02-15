# == Schema Information
#
# Table name: facebook_posts
#
#  id            :integer          not null, primary key
#  post_id       :integer
#  upcode        :string
#  posted_at     :datetime
#  message       :string
#  link          :string
#  comment_count :integer
#  like_count    :integer
#  share_count   :integer
#  extra         :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class FacebookPost < ActiveRecord::Base
  belongs_to :page, class_name: FacebookPage, foreign_key: "page_id"
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

  def sync(data)
    data.extend Hashie::Extensions::DeepFetch
    self.extra = data.to_h

    self.posted_at     = data["created_time"]
    self.likes_count    = data.deep_fetch("likes", "summary", "total_count") { 0 }
    self.comments_count = data.deep_fetch("comments", "summary", "total_count") { 0 }
    self.shares_count   = data.deep_fetch("shares", "count") { 0 }
    self.attributes = data.slice("message", "link")
    save
  end

end
