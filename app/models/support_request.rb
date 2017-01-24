class SupportRequest < ApplicationRecord
  update_index 'support_requests#support_request', :self

  belongs_to :user

  validates :title, :body, presence: true
  validates :title, length: { maximum: 255 }
  validates :body, length: { maximum: 2000 }
end
