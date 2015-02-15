# == Schema Information
#
# Table name: twitter_tweet_trackings
#
#  id             :integer          not null, primary key
#  tweet_id       :integer
#  recording_at   :datetime
#  retweet_count  :integer
#  favorite_count :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class TwitterTweetTracking < ActiveRecord::Base
  belongs_to :tweet, class_name: TwitterTweet, foreign_key: "tweet_id"
end
