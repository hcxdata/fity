class InstagramUserWorker
  include Sidekiq::Worker
  include Clients
  sidekiq_options retry: 5

  def perform(user_id)
    instagram_user = InstagramUser.find(user_id)
    user = instagram_client.user_search(instagram_user.username).find { |user| user.username.downcase == instagram_user.username.downcase }
    instagram_user.sync!(instagram_client.user(user.id).as_json)

    if !user.profile_picture? && (profile_picture_url = user.profile_picture)
      user.profile_picture = download_file(profile_picture_url)
      user.save!
    end
  end
end
