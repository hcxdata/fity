class CreateInstagramMedia < ActiveRecord::Migration
  def change
    create_table :instagram_media do |t|

      t.belongs_to :user, index: true

      t.string  :upcode
      t.string  :type
      t.string  :link
      t.string  :caption_id

      t.string  :created_time
      t.integer :likes_count
      t.integer :comments_count

      t.text   :caption_text

      t.text :extra

      t.timestamps null: false
    end
  end
end
