# Base class for Managers
# Managers are Plain Ruby classes that implement business logic
# it can accept +current_user+ in initializer
# and provides +with_transaction+ helper
class ApplicationManager
  # @param [User] current_user
  def initialize(current_user = nil)
    @current_user = current_user
  end

  private

  def with_transaction
    result = nil
    ActiveRecord::Base.transaction do
      result = yield
    end
    result
  end
end
