class UsersController < ApplicationController
  skip_before_action :authenticate_user
  skip_after_action :verify_authorized

  def signup
    register_user
    head :created
  end

  private

  def signup_params
    params.require(:signup).permit(
      :email, :password, :first_name, :last_name
    )
  end

  def register_user
    RegisterUserService.new(signup_params).call
  end
end
