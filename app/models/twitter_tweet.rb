# == Schema Information
#
# Table name: twitter_tweets
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  upcode         :string           not null
#  posted_at      :datetime         not null
#  extra          :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  text           :text
#  retweet_count  :integer
#  favorite_count :integer
#  media          :string
#

class TwitterTweet < ActiveRecord::Base
  store :extra, coder: JSON
  mount_uploader :media, MediaUploader

  belongs_to :user, class_name: TwitterUser, foreign_key: "user_id"
  has_many :trackings, class_name: TwitterTweetTracking, foreign_key: "tweet_id", autosave: true

  after_create :async_download_media

  def async_download_media
    TwitterTweetMediaWorker.perform_async(id)
  end

  def sync(data)
    self.extra = data.to_h

    self.posted_at = data.created_at
    self.attributes = data.attrs.slice(:text, :retweet_count, :favorite_count)
    build_tracking
    save
  end

  def build_tracking
    trackings.build(recording_at: Time.current, retweet_count: retweet_count, favorite_count: favorite_count)
  end
end
