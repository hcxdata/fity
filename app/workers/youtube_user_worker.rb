class YoutubeUserWorker
  # include Sidekiq::Worker
  include YoutubeClient
  # sidekiq_options retry: 5

  def perform(user_id)
    youtube_user = YoutubeUser.find(user_id)
    user_profile = youtube_client.profile(youtube_user.username)
    youtube_user.sync(user_profile.as_json)
  end
end
