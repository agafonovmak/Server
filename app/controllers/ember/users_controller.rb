class Ember::UsersController < Ember::BaseController
  before_action :authenticate_user!, except: :authenticate

  def authenticate
    user = User.find_by(email: params[:user][:email])
    if user.nil?
      head 404
    else
      if user.valid_password?(params[:user][:password])
        if user.has_role?(:client)
          head 401
        else
          data = {
              token: user.authentication_token,
              user_id: user.id.to_s,
              email: user.email
          }
          render json: data, status: :ok
        end
      else
        head 401
      end
    end
  end

end
