# == Schema Information
#
# Table name: instagram_users
#
#  id                :integer          not null, primary key
#  account_id        :integer
#  upcode            :string
#  username          :string
#  full_name         :string
#  profile_picture   :string
#  website           :string
#  media_count       :integer
#  follows_count     :integer
#  followed_by_count :integer
#  bio               :text
#  sync_at           :datetime
#  extra             :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

FactoryGirl.define do
  factory :instagram_user do
    
  end

end
