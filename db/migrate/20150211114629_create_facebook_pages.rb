class CreateFacebookPages < ActiveRecord::Migration
  def change
    create_table :facebook_pages do |t|
      t.belongs_to :account, index: true

      t.string :username
      t.string :upcode
      t.datetime :sync_at

      t.string  :name
      t.text    :bio
      t.string  :link
      t.integer :likes
      t.integer :talking_about_count

      t.text :extra

      t.timestamps null: false
    end
  end
end
