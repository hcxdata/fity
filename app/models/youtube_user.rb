class YoutubeUser < ActiveRecord::Base
  store :extra, coder: JSON
  belongs_to :account

  def sync(data)
    self.sync_at = Time.current
    self.extra = data.to_h
    # self.upcode = data["user_id"]

    self.attributes = data.slice('username_display', 'user_id', 'channel_uri', 'avatar', 'gender', 'location', 'subscribers', 'upload_count', 'upload_views')
    save
  end
end
