class YoutubeKeywordSearchWorker
  include Sidekiq::Worker
  include Clients
  sidekiq_options retry: 5

  def perform(keyword_id)
    keyword = Keyword.find(keyword_id)
    youtube_datas = youtube_client.videos_by(query: keyword.words)
    youtube_datas.videos.each do |youtube_data|
      user_data = youtube_data.author
      user = YoutubeUser.where(username: user_data.uri.rpartition('/').last).first_or_initialize
      user.sync!(user_data.as_json)
      video = user.videos.where(upcode: youtube_data.unique_id).first_or_initialize
      video.sync!(youtube_data.as_json)
    end
  end
end
