FactoryGirl.define do
  factory :reply do
    body { Faker::Lorem.paragraph }
    ticket
    user
  end
end
