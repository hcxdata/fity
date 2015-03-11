# == Schema Information
#
# Table name: instagram_media
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  upcode         :string
#  type           :string
#  link           :string
#  caption_id     :string
#  created_time   :string
#  likes_count    :integer
#  comments_count :integer
#  caption_text   :text
#  extra          :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

FactoryGirl.define do
  factory :instagram_medium do
    
  end

end
