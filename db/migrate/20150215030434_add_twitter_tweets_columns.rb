class AddTwitterTweetsColumns < ActiveRecord::Migration
  def change
    change_table :twitter_tweets do |t|
      t.text :text
      t.integer :retweet_count
      t.integer :favorite_count
    end
  end
end
