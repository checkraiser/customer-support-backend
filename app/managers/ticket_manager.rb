# TicketManager is responsible for
# creating, changing statuses of and replying to tickets
class TicketManager < ApplicationManager
  # @param [String] title
  # @param [String] body
  def create(title, body)
    @current_user.tickets.create!(title: title, body: body)
  end

  # @param [] ticket
  # @param [String] reply
  # @param [String] status
  def reply(ticket, reply, status)
    with_transaction do
      ticket.replies.create!(body: reply, user: @current_user)
      ticket.update!(status: status) if status.present?
    end
  end

  # @param [] ticket
  def reopen(ticket)
    with_transaction do
      ticket.update!(status: Ticket::STATUS.open)
    end
  end

  # @param [] ticket
  def close(ticket)
    with_transaction do
      ticket.update!(status: Ticket::STATUS.closed, closed_at: Time.current)
    end
  end
end
