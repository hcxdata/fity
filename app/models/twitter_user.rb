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

class TwitterUser < ActiveRecord::Base
  belongs_to :account
  has_many :tweets, class_name: TwitterTweet, foreign_key: "user_id"

  def sync(data)
    self.sync_at = Time.current
    self.extra = data.to_h
    self.upcode = data.id.to_s
    self.attributes = data.attrs.slice(:name, :location, :description, :url, :followers_count, :friends_count, :statuses_count)
    save
  end
end
