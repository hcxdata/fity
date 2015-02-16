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
  has_many :youtube_users


  def self.schedule_all
    Account.find_each do |account|
      account.twitter_users.find_each do |u|
        TwitterUserWorker.perform_in(rand(60), u.id)
        TwitterUserTimelineWorker.perform_in(rand(60), u.id)
      end

      account.facebook_pages.find_each do |p|
        FacebookPageWorker.perform_in(rand(60), p.id)
        FacebookPagePostsWorker.perform_in(rand(60), p.id)
      end

      account.youtube_users.find_each do |u|
        YoutubeUserWorker.perform_in(rand(60), u.id)
        YoutubeUserVideoWorker.perform_in(rand(60), u.id)
      end
    end
  end
end
