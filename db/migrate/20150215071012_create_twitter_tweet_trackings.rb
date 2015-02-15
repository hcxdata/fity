class CreateTwitterTweetTrackings < ActiveRecord::Migration
  def change
    create_table :twitter_tweet_trackings do |t|
      t.belongs_to :tweet, index: true
      t.datetime :recording_at

      t.integer :retweet_count
      t.integer :favorite_count

      t.timestamps null: false
    end
  end
end
