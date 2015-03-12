class UpdateUrlToFacebookTwitterYoutube < ActiveRecord::Migration
  class FacebookPost < ActiveRecord::Base
  end
  class TwitterTweet < ActiveRecord::Base
    belongs_to :user, class_name: TwitterUser, foreign_key: "user_id"
  end
  class TwitterUser < ActiveRecord::Base
    has_many :tweets, class_name: TwitterTweet, foreign_key: "user_id"
  end
  class YoutubeVideo < ActiveRecord::Base
  end
  def change
    FacebookPost.where(post_url: nil) do |facebook_post|
      facebook_post.update(post_url: "https://www.facebook.com/#{facebook_post.upcode.gsub('_', '/posts/')}")
    end
    TwitterTweet.where(post_url: nil) do |twitter_tweet|
      twitter_tweet.update(post_url: "https://twitter.com/#{twitter_tweet.user.upcode}/status/#{twitter_tweet.updcode}")
    end
    YoutubeVideo.where(player_url: nil) do |youtube_video|
      youtube_video.update(player_url: youtube_video.extra['player_url'])
    end
  end
end
