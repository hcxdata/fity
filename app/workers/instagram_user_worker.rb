class InstagramUserWorker
  include Sidekiq::Worker
  include Clients
  sidekiq_options retry: 5

  def perform(user_id)
    instagram_user = InstagramUser.find(user_id)
    
    users = instagram_client.user_search(instagram_user.username)
    users.each do |user|
      if(user.username == instagram_user.username)
        instagram_user.sync!(instagram_client.user(user.id).as_json)
        save_user_mage!(instagram_user,user.profile_picture)
      else
        i_user = InstagramUser.where(username: user.username).first_or_initialize
        i_user.sync!(user.as_json)
        save_user_mage!(i_user,user.profile_picture)
      end
    end
  end
  def save_user_mage!(user, image_url)
    if (image_url)
      user.profile_picture = download_file(image_url)
      user.save!
    end
  end
end
