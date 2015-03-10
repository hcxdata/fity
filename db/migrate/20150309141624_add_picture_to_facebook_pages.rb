class AddPictureToFacebookPages < ActiveRecord::Migration
  def change
    change_table :facebook_pages do |t|
      t.string :picture
    end
  end
end
