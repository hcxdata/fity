# == Schema Information
#
# Table name: facebook_posts
#
#  id             :integer          not null, primary key
#  page_id        :integer
#  upcode         :string           not null
#  message        :text
#  type           :string
#  created_time   :datetime         not null
#  updated_time   :datetime         not null
#  extra          :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  comments_count :integer
#  likes_count    :integer
#  shares_count   :integer
#  link           :string
#

FactoryGirl.define do
  factory :facebook_post do
  end
end
