FactoryGirl.define do
  sequence :support_agent_email do |n|
    "support_agent#{n}@example.com"
  end

  sequence :customer_email do |n|
    "customer#{n}@example.com"
  end
end
