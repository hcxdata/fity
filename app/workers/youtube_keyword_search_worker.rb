class YoutubeKeywordSearchWorker
  include Sidekiq::Worker
  include Clients
  sidekiq_options retry: 5

  def perform(keyword_id)
    keyword = Keyword.find(keyword_id)
    youtube_datas = youtube_client.videos_by(query: keyword.words)
    youtube_datas.videos.each do |youtube_data|
      with_proxy_env do
        user_profile = youtube_client.profile(youtube_data.author.uri.rpartition('/').last)
        user = YoutubeUser.where(username: user_profile.username).first_or_initialize
        user.sync!(user_profile.as_json)

        video = user.videos.where(upcode: youtube_data.unique_id).first_or_initialize
        video.sync!(youtube_data.as_json)
      end
    end
  end
end
