class TwitterUserWorker
  def perform(user_id)
    twitter_user = TwitterUser.find(user_id)

    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "Q3tqxJrvM01dAxS7ddfiJyzgI"
      config.consumer_secret     = "BnHCNvQ2i5g9yjasMi37pz3cBHQ5b8xmPKTWuFMWwM3t2iPRTp"
    end

    user_data = client.user(twitter_user.screen_name)
    twitter_user.sync(user_data.to_h)
  end
end
