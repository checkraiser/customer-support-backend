# UserManager is responsible for manage users
class UserManager < ApplicationManager
  # @param [Hash] signup_params
  def create(signup_params)
    with_transaction do
      User.create!(signup_params)
    end
  end

  # destroys the user
  # @param [User] user
  def destroy(user)
    user.destroy!
  end
end
