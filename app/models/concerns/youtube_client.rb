module YoutubeClient
  extend ActiveSupport::Concern

  def youtube_client
    @youtube_client ||= client = YouTubeIt::Client.new(:dev_key => "#{Project.youtube_dev_key}")
  end

  def youtube_http_options
    { proxy: Project.proxy_url }
  end
end
