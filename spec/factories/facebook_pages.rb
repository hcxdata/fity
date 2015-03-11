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
#  picture             :string
#

FactoryGirl.define do
  factory :facebook_page do
    account
    sequence(:username) { |n| "facebook-#{n}" }

    # username "MyString"
    # name "MyString"
    # likes 1
    # talking_about_count 1
    # bio "MyText"
    # upcode "MyString"
    # account nil
    # link "MyString"
    # extra "MyText"
  end

end
