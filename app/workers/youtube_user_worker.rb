class YoutubeUserWorker
  include Sidekiq::Worker
  include Clients
  sidekiq_options retry: 5

  def perform(user_id)
    youtube_user = YoutubeUser.find(user_id)

    with_proxy_env do
      user_profile = youtube_client.profile(youtube_user.username)
      youtube_user.sync!(user_profile.as_json)

      if (avatar_url = user_profile.avatar)
        youtube_user.avatar = download_file(avatar_url)
        youtube_user.save!
      end
    end
  end
end
