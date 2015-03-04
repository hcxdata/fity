class InstagramUser < ActiveRecord::Base
  store :extra, coder: JSON
  belongs_to :account
  has_many :medium, class_name: InstagramMedium, foreign_key: "user_id"

  def sync!(data)
    data.extend Hashie::Extensions::DeepFetch
    self.sync_at = Time.current
    self.extra = data.to_h
    self.upcode = data['id']
    self.media = data.deep_fetch("counts", "media") { 0 }
    self.follows = data.deep_fetch("counts", "follows") { 0 }
    self.followed_by   = data.deep_fetch("counts", "followed_by") { 0 }
    self.attributes = data.slice('upcode', 'username', 'full_name', 'profile_picture', 'bio', 'website')
    save!
  end
end
