class TwitterUserTimelineWorker
  include Sidekiq::Worker
  include Clients
  sidekiq_options retry: 5

  def perform(user_id)
    twitter_user = TwitterUser.find(user_id)
    tweet_datas = twitter_client.user_timeline(twitter_user.screen_name)
    tweet_datas.each do |data|
      tweet = twitter_user.tweets.where(upcode: data.id.to_s).first_or_initialize
      tweet.sync!(data)
    end
  end
end
