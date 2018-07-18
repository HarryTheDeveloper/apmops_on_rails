class Overrides::DeviseTokenAuth::RegistrationsController < DeviseTokenAuth::RegistrationsController
  private

  def sign_up_params
    params.permit(:email, :password, :password_confirmation,
                  :name, :nickname, :image)
  end
end
