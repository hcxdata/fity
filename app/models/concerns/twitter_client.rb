module TwitterClient
  extend ActiveSupport::Concern

  def twitter_client
    @twitter_client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = Project.twitter_consumer_key
      config.consumer_secret     = Project.twitter_consumer_secret
    end
  end
end
