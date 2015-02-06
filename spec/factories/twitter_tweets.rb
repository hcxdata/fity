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

FactoryGirl.define do
  factory :twitter_tweet do
  end
end