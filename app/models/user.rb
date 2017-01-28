class User < ApplicationRecord
  has_secure_password
  include UserAuth

  has_many :tickets

  validates :first_name, :last_name, :email, presence: true

  def name
    "#{first_name} #{last_name}"
  end

  def support_agent?
    role == 'support_agent'
  end

  def customer?
    role == 'customer'
  end

  def admin?
    role == 'admin'
  end
end
