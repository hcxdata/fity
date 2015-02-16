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
end
