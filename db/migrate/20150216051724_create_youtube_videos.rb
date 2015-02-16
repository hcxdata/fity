class CreateYoutubeVideos < ActiveRecord::Migration
  def change
    create_table :youtube_videos do |t|
      t.belongs_to :user, index: true

      t.string  :unique_id
      t.string  :title
      t.integer :comment_count
      t.integer :favorite_count
      t.integer :view_count
      t.string  :published_at
      t.text    :description

      t.text   :extra

      t.timestamps null: false
    end
  end
end
