# UserCreationManager is responsible for creating users
# it also may hold any things related to signing up process
class UserCreationManager < ApplicationManager
  # @param [Hash] signup_params
  def create(signup_params)
    with_transaction do
      raise ApplicationError, 'User is already signed up' if user_exist?(signup_params)
      User.create!(signup_params)
    end
  end

  private

  def user_exist?(signup_params)
    User.where(email: signup_params[:email]).any?
  end
end
