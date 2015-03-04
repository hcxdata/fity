module Clients
  extend ActiveSupport::Concern

  def facebook_client
    @facebook_client ||= Koala::Facebook::API.new("#{Project.facebook_app_id}|#{Project.facebook_app_secret}")
  end

  def facebook_http_options
    http_options
  end

  def http_options
    { proxy: Project.proxy_url }
  end

  def http_client
    @http_client ||= Faraday.new(http_options)
  end

  def twitter_client
    @twitter_client ||= Twitter::REST::Client.new do |config|
      config.consumer_key     = Project.twitter_consumer_key
      config.consumer_secret  = Project.twitter_consumer_secret

      config.proxy = Project.proxy_url
    end
  end

  def with_youtube_client
    @youtube_client ||= YouTubeIt::Client.new(dev_key: Project.youtube_dev_key)

    with_proxy_env do
      yield @youtube_client
    end
  end

  def youtube_client
    @youtube_client ||= YouTubeIt::Client.new(dev_key: Project.youtube_dev_key)
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

  def download_file(url)
    res = http_client.get(url)
    content_type = res.headers["content-type"]
    type = MIME::Types[content_type].first
    file = Tempfile.new(["fity-", ".#{type.extensions.first}"])
    File.open(file, "wb") { |f| f << res.body }
    file
  end

  def instagram_client
    @instagram_client ||= Instagram.client(access_token: Project.instagram_access_token, proxy: Project.proxy_url)
    
  end
end
