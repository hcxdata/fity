class CreateFacebookPostTrackings < ActiveRecord::Migration
  def change
    create_table :facebook_post_trackings do |t|
      t.belongs_to :post, index: true
      t.datetime :recording_at
      t.integer :comments_count
      t.integer :likes_count
      t.integer :shares_count

      t.timestamps null: false
    end
  end
end
