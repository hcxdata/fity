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
      res = http_client.get(data["media_url"])
      content_type = res.headers["content-type"]
      type = MIME::Types[content_type].first
      file = Tempfile.new(["fity-", ".#{type.extensions.first}"])
      File.open(file, "wb") { |f| f << res.body }
      tweet.media = file
      tweet.save!
    end
  end
end
