# == Schema Information
#
# Table name: facebook_pages
#
#  id                  :integer          not null, primary key
#  account_id          :integer
#  username            :string
#  upcode              :string
#  sync_at             :datetime
#  name                :string
#  bio                 :text
#  link                :string
#  likes               :integer
#  talking_about_count :integer
#  extra               :text
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class FacebookPage < ActiveRecord::Base
  store :extra, coder: JSON
  belongs_to :account
  has_many :posts, class_name: FacebookPost, foreign_key: "page_id"

  def sync!(data)
    self.sync_at = Time.current
    self.extra = data.to_h
    self.upcode = data["id"]

    self.attributes = data.slice('username', 'name', 'bio', 'link', 'likes', 'talking_about_count')
    save!
  end
end
