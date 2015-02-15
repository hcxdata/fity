class CreateFacebookPosts < ActiveRecord::Migration
  def change
    create_table :facebook_posts do |t|
      t.belongs_to :post, index: true

      t.string   :upcode, index: true
      t.datetime :posted_at

      t.string  :message
      t.string  :link
      t.integer :comment_count
      t.integer :like_count
      t.integer :share_count

      t.text :extra

      t.timestamps null: false
    end
  end
end
