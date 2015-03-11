# == Schema Information
#
# Table name: facebook_posts
#
#  id             :integer          not null, primary key
#  page_id        :integer
#  upcode         :string
#  posted_at      :datetime
#  message        :text
#  link           :string
#  comments_count :integer
#  likes_count    :integer
#  shares_count   :integer
#  extra          :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  post_url       :string
#

FactoryGirl.define do
  factory :facebook_post do
  end
end
