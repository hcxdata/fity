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
end
