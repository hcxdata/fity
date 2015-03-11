class ClearAvatarToYoutubeUsers < ActiveRecord::Migration
  class YoutubeUser < ActiveRecord::Base
  end
  def change
    YoutubeUser.update_all(avatar: nil)
  end
end
