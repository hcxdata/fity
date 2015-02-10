FactoryGirl.define do
  factory :facebook_user do
    account
    sequence(:name) { |n| "facebook-#{n}" }
  end

end
