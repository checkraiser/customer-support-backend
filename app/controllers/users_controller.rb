class UsersController < ApplicationController
  skip_before_action :authenticate_user
  skip_after_action :verify_authorized

  def index
    present(paginate(search(search_params)))
  end

  def signup
    UserCreationManager.new.create(signup_params)
    head :created
  end

  private

  def signup_params
    params.permit(
      :email, :password, :first_name, :last_name
    )
  end
end
