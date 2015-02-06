class TwitterUserWorker
  include TwitterClient

  def perform(user_id)
    twitter_user = TwitterUser.find(user_id)
    user_data = twitter_client.user(twitter_user.screen_name)
    twitter_user.sync(user_data)
  end
end
