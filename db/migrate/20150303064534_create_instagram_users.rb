class CreateInstagramUsers < ActiveRecord::Migration
  def change
    create_table :instagram_users do |t|

      t.belongs_to :account, index: true

      t.string  :upcode
      t.string  :username
      t.string  :full_name
      t.string  :profile_picture
      t.string  :website
      t.integer :media
      t.integer :follows
      t.integer :followed_by
      t.text    :bio

      t.datetime :sync_at
      t.text :extra

      t.timestamps null: false
    end
  end
end
