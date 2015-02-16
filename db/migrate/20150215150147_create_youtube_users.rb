class CreateYoutubeUsers < ActiveRecord::Migration
  def change
    create_table :youtube_users do |t|
      t.belongs_to :account, index: true

      t.string :username
      t.string :username_display
      t.string :user_id
      t.string :channel_uri
      t.string :avatar
      t.string :gender
      t.string :location
      t.string :subscribers
      t.string :upload_count
      t.string :upload_views

      t.datetime :sync_at

      t.text :extra

      t.timestamps null: false
    end
  end
end
