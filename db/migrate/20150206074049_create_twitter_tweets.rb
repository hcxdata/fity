class CreateTwitterTweets < ActiveRecord::Migration
  def change
    create_table :twitter_tweets do |t|
      t.belongs_to :user, index: true
      t.string   :upcode,    index: true, null: false
      t.datetime :posted_at, index: true, null: false
      t.text :extra

      t.timestamps null: false
    end
  end
end
