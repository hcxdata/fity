# == Schema Information
#
# Table name: twitter_tweets
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  upcode     :string           not null
#  posted_at  :datetime         not null
#  extra      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TwitterTweet < ActiveRecord::Base
  belongs_to :user, class_name: TwitterUser, foreign_key: "user_id"

  def sync(data)
    self.extra = data.to_h
    self.posted_at = data.created_at
    save
  end
end
