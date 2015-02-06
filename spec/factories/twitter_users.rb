# == Schema Information
#
# Table name: twitter_users
#
#  id              :integer          not null, primary key
#  account_id      :integer
#  screen_name     :string
#  upcode          :string
#  sync_at         :datetime
#  name            :string
#  location        :string
#  description     :string
#  url             :string
#  followers_count :integer
#  friends_count   :integer
#  statuses_count  :integer
#  extra           :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

FactoryGirl.define do
  factory :twitter_user do
    account
    sequence(:screen_name) { |n| "twitter-#{n}" }
  end
end
