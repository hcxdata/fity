class TwitterKeywordSearchWorker
  include Sidekiq::Worker
  include Clients
  sidekiq_options retry: 5

  def perform(keyword_id)
    keyword = Keyword.find(keyword_id)
    tweet_datas = twitter_client.search(keyword.words, result_type: "recent").take(15)
    tweet_datas.each do |tweet_data|
      user_data = tweet_data.user
      user = TwitterUser.where(screen_name: user_data.screen_name).first_or_initialize
      user.sync!(user_data)

      tweet = user.tweets.where(upcode: tweet_data.id.to_s).first_or_initialize
      tweet.sync!(tweet_data)
    end
  end
end
