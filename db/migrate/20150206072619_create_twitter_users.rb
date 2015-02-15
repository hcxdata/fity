class CreateTwitterUsers < ActiveRecord::Migration
  def change
    create_table :twitter_users do |t|
      t.belongs_to :account, index: true

      t.string   :screen_name
      t.string   :upcode
      t.datetime :sync_at

      t.string  :name
      t.string  :location
      t.string  :description
      t.string  :url
      t.integer :followers_count
      t.integer :friends_count
      t.integer :statuses_count

      t.text :extra
      t.timestamps null: false
    end
  end
end
