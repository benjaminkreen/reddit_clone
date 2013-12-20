# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sub do
    association :moderator, :factory => :user
    sequence :name do |n|
      Faker::Commerce.department + "#{n}"
    end
  end
end
