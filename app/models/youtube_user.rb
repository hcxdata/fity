# == Schema Information
#
# Table name: youtube_users
#
#  id               :integer          not null, primary key
#  account_id       :integer
#  username         :string
#  username_display :string
#  user_id          :string
#  channel_uri      :string
#  avatar           :string
#  gender           :string
#  location         :string
#  subscribers      :string
#  upload_count     :string
#  upload_views     :string
#  sync_at          :datetime
#  extra            :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class YoutubeUser < ActiveRecord::Base
  store :extra, coder: JSON
  belongs_to :account
  has_many :videos, class_name: YoutubeVideo, foreign_key: "user_id"
  mount_uploader :avatar, MediaUploader

  def sync!(data)
    self.sync_at = Time.current
    self.extra = data.to_h
    # self.upcode = data["user_id"]

    self.attributes = data.slice('username', 'username_display', 'user_id', 'channel_uri', 'avatar', 'gender', 'location', 'subscribers', 'upload_count', 'upload_views')
    save!
  end
end
