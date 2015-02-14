class CreateFacebookUsers < ActiveRecord::Migration
  def change
    create_table :facebook_users do |t|
      t.belongs_to :account, index: true, uniq: true

      t.string   :upcode
      t.string   :name
      t.string   :first_name
      t.string   :last_name
      t.string   :upcode
      t.string   :link
      t.string   :gender
      t.string   :locale
      t.datetime :timezone
      t.datetime :updated_time
      t.boolean  :verified

      t.text :extra
      t.datetime :sync_at

      t.timestamps null: false
    end

    add_foreign_key :twitter_users, :accounts
  end
end
