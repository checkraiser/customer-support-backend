class SupportRequestsController < ApplicationController
  before_action :authorize_resource

  def index
    present(paginate(search(search_params)))
  end

  def show
    present(record)
  end

  def create
    support_request_manager.create(*create_params)
  end

  private

  def authorize_resource
    return authorize(:support_request) if no_resource?
    authorize record
  end

  def support_request_manager
    SupportRequestManager.new(current_user)
  end

  def create_params
    params.permit(:title, :body).values_at(:title, :body)
  end

  def search_params
    if policy(:support_request).unfiltered_search?
      params.permit(:status, :q)
    else
      params.permit(:status, :q).merge(user_id: current_user.id)
    end
  end
end
