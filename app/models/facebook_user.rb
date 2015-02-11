# == Schema Information
#
# Table name: twitter_users
#
#  id              :integer          not null, primary key
#  account_id      :integer
#  upcode          :string
#  name            :string
#  first_name      :string
#  last_name       :string
#  upcode          :string
#  link            :string
#  gender          :string
#  locale          :string
#  timezone        :datetime
#  updated_time    :datetime
#  verified        :boolean
#  extra           :text
#  sync_at         :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class FacebookUser < ActiveRecord::Base
  belongs_to :account
  has_many :posts,class_name: FacebookPost,foreign_key: "user_id"
  
  def sync(data)
    self.sync_at = Time.current
    self.extra = data.to_h
    self.upcode = data["id"]
    self.attributes = data.slice(:name, :first_name, :last_name, :link, :gender, :locale, :timezone, :updated_time, :verified)
    save
  end
end
