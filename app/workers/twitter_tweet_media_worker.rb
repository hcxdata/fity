class TwitterTweetMediaWorker
  include Sidekiq::Worker
  include Clients
  sidekiq_options retry: 5

  def perform(tweet_id)
    tweet = TwitterTweet.find(tweet_id)
    entities = (tweet.extra["entities"] || {})
    media = entities["media"] || []
    data = media.find { |m| m["type"] == "photo" }

    if data
      tweet.media = download_file(data["media_url"])
      tweet.save!
    end
  end
end
