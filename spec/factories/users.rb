FactoryGirl.define do
  factory :customer, class: 'User' do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { generate :customer_email }
    password 'password'
    role 'customer'

    factory :support_agent do
      role 'support_agent'
    end
  end
end
