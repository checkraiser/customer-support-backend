class User < ApplicationRecord
  update_index 'users#user', :self
  ROLE = OpenStruct.new(admin: 'admin', agent: 'support_agent', customer: 'customer').freeze

  has_secure_password
  include UserAuth

  has_many :tickets, dependent: :restrict_with_error

  validates :first_name, :last_name, :email, presence: true

  def name
    "#{first_name} #{last_name}"
  end

  def support_agent?
    role == ROLE.agent
  end

  def customer?
    role == ROLE.customer
  end

  def admin?
    role == ROLE.admin
  end
end
