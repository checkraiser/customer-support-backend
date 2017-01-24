class UserTokenController < Knock::AuthTokenController
  private

  def auth_params
    params.require(:auth).permit :email, :phone, :password
  end
end
