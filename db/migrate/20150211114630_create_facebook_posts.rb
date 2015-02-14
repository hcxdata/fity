class CreateFacebookPosts < ActiveRecord::Migration
  def change
    create_table :facebook_posts do |t|
      t.belongs_to :user, index: true

      t.string   :upcode, index: true, null: false
      t.string   :message
      t.string   :type
      t.datetime :created_time, index: true, null: false
      t.datetime :updated_time, index: true, null: false
      t.text :extra

      t.timestamps null: false
    end

    add_foreign_key :facebook_feeds, :facebook_users
  end
end
