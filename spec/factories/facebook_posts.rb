# == Schema Information
#
# Table name: facebook_posts
#
#  id            :integer          not null, primary key
#  post_id       :integer
#  upcode        :string
#  posted_at     :datetime
#  message       :string
#  link          :string
#  comment_count :integer
#  like_count    :integer
#  share_count   :integer
#  extra         :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

FactoryGirl.define do
  factory :facebook_post do
  end
end
