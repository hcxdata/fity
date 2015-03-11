class ClearProfilePictureToInstagramUsers < ActiveRecord::Migration
  class InstagramUser < ActiveRecord::Base
  end

  def change
    InstagramUser.update_all(profile_picture: nil)
  end
end
