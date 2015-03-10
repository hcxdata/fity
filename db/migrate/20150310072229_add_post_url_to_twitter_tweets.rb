class AddPostUrlToTwitterTweets < ActiveRecord::Migration
  def change
    change_table :twitter_tweets do |t|
      t.string :post_url
    end
  end
end
