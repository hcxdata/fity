class YoutubeUserVideoWorker
  include Sidekiq::Worker
  include Clients
  sidekiq_options retry: 5

  def perform(user_id)
    youtube_user = YoutubeUser.find(user_id)

    with_proxy_env do
      video_search = youtube_client.videos_by(user: youtube_user.username)
      video_search.videos.each do |data|
        youtube_video = youtube_user.videos.where(unique_id: data.unique_id).first_or_initialize
        youtube_video.sync(data.as_json)
      end
    end
  end
end
