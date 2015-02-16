# == Schema Information
#
# Table name: keywords
#
#  id         :integer          not null, primary key
#  words      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :keyword do
    sequence(:words) { |n| "keyword-#{n}" }
  end
end
