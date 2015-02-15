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

FactoryGirl.define do
  factory :twitter_tweet_tracking do
    tweet nil
    recording_at "2015-02-15 15:10:12"
    retweet_count 1
    favorite_count 1
  end

end
