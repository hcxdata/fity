FactoryGirl.define do
  factory :keyword do
    sequence(:words) { |n| "keyword-#{n}" }
  end
end
