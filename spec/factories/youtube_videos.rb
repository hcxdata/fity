# == Schema Information
#
# Table name: youtube_videos
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  unique_id      :string
#  title          :string
#  comment_count  :integer
#  favorite_count :integer
#  view_count     :integer
#  published_at   :string
#  description    :text
#  extra          :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

FactoryGirl.define do
  factory :youtube_video do
    
  end

end
