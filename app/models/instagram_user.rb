# == Schema Information
#
# Table name: instagram_users
#
#  id                :integer          not null, primary key
#  account_id        :integer
#  upcode            :string
#  username          :string
#  full_name         :string
#  profile_picture   :string
#  website           :string
#  media_count       :integer
#  follows_count     :integer
#  followed_by_count :integer
#  bio               :text
#  sync_at           :datetime
#  extra             :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class InstagramUser < ActiveRecord::Base
  store :extra, coder: JSON
  belongs_to :account
  has_many :media, class_name: InstagramMedium, foreign_key: "user_id"
  mount_uploader :profile_picture, MediaUploader

  def sync!(data)
    data.extend Hashie::Extensions::DeepFetch
    self.sync_at = Time.current
    self.extra = data.to_h
    self.upcode = data['id']
    self.media_count = data.deep_fetch("counts", "media") { 0 }
    self.follows_count = data.deep_fetch("counts", "follows") { 0 }
    self.followed_by_count   = data.deep_fetch("counts", "followed_by") { 0 }
    self.attributes = data.slice('upcode', 'username', 'full_name', 'bio', 'website')
    save!
  end
end
