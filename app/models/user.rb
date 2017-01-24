class User < ApplicationRecord
  has_secure_password
  include UserAuth

  has_many :support_requests

  def name
    "#{first_name} #{last_name}"
  end

  def support_agent?
    role == 'support_agent'
  end

  def customer?
    role == 'customer'
  end
end
