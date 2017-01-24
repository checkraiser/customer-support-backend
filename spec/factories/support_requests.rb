FactoryGirl.define do
  factory :support_request do
    title { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraph }
    user factory: :customer
    status 'new'
  end
end
