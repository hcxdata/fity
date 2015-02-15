# == Schema Information
#
# Table name: facebook_post_trackings
#
#  id             :integer          not null, primary key
#  post_id        :integer
#  recording_at   :datetime
#  comments_count :integer
#  likes_count    :integer
#  shares_count   :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

FactoryGirl.define do
  factory :facebook_post_tracking do
    post nil
    recording_at "2015-02-15 15:17:29"
    comments_count 1
    likes_count 1
    shares_count 1
  end

end
