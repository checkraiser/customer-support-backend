FactoryGirl.define do
  factory :ticket do
    title { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraph }
    user factory: :customer
    status 'new'
  end
end
