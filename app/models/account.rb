# == Schema Information
#
# Table name: accounts
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Account < ActiveRecord::Base
  has_many :twitter_users
  has_many :facebook_pages


  def self.schedule_all
    Account.find_each do |account|
      account.twitter_users.find_each do |u|
        TwitterUserWorker.perform_async(u.id)
        TwitterUserTimelineWorker.perform_async(u.id)
      end

      account.facebook_pages.find_each do |p|
        FacebookPageWorker.perform_async(p.id)
        FacebookPagePostsWorker.perform_async(p.id)
      end
    end
  end
end
