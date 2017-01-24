class SupportRequestManager < ApplicationManager
  # @param [User] current_user
  def initialize(current_user)
    @current_user = current_user
  end

  # @param [String] title
  # @param [String] body
  def create(title, body)
    @current_user.support_requests.create!(title: title, body: body)
  end
end
