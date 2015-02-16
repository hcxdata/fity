module YoutubeClient
  extend ActiveSupport::Concern

  def with_youtube_client
    @youtube_client ||= YouTubeIt::Client.new(dev_key: Project.youtube_dev_key)

    with_proxy_env do
      yield @youtube_client
    end
  end

  def with_proxy_env
    orig_http_proxy = ENV["http_proxy"]
    orig_https_proxy = ENV["https_proxy"]
    begin
      ENV["http_proxy"] = ENV["https_proxy"] = Project.proxy_url
      yield
    ensure
      ENV["http_proxy"] = orig_http_proxy
      ENV["https_proxy"] = orig_https_proxy
    end
  end
end
