class ReportPresenter < ApplicationPresenter
  class TicketPresenter < ::TicketPresenter
    def open_time
      closed_at - created_at
    end

    def author
      object.user.name
    end
  end

  def total
    object.data.count
  end

  def data
    TicketPresenter.decorate(object.data)
  end
end
