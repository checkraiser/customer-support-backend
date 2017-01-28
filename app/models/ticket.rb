class Ticket < ApplicationRecord
  STATUS = OpenStruct.new(new: 'new', open: 'open', closed: 'closed').freeze

  update_index 'tickets#ticket', :self

  belongs_to :user
  has_many :replies, foreign_key: :ticket_id

  validates :title, :body, presence: true
  validates :title, length: { maximum: 255 }
  validates :body, length: { maximum: 2000 }

  def closed?
    status == STATUS.closed
  end
end
