class RegisterUserService < ApplicationService
  def initialize(signup_params)
    @email = signup_params[:email]
    @password = signup_params[:password]
    @first_name = signup_params[:first_name]
    @last_name = signup_params[:last_name]
  end

  private

  attr_reader :email, :password, :first_name, :last_name

  def execute!
    raise ApplicationError, 'User is already signed up' if user_exist?
    user = create_user
  end

  def create_user
    User.create! email: email,
                 password: password,
                 first_name: first_name,
                 last_name: last_name
  end

  def user_exist?
    User.where(email: email).any?
  end
end
