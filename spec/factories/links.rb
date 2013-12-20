# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :link do
    association :submitter, :factory => :user
    title Faker::Commerce.department
    url Faker::Internet.url
    body Faker::Commerce.product_name
  end
end

