# == Schema Information
#
# Table name: youtube_users
#
#  id               :integer          not null, primary key
#  account_id       :integer
#  username         :string
#  username_display :string
#  user_id          :string
#  channel_uri      :string
#  avatar           :string
#  gender           :string
#  location         :string
#  subscribers      :string
#  upload_count     :string
#  upload_views     :string
#  sync_at          :datetime
#  extra            :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

FactoryGirl.define do
  factory :youtube_user do
    
  end

end
