class AddMediaToTwitterTweets < ActiveRecord::Migration
  def change
    change_table :twitter_tweets do |t|
      t.string :media
    end
  end
end
