require 'exceptions/send_sms_exception'

class Mobile::UsersController < ::Mobile::BaseController
  before_action :set_user, only: [:get_workouts, :get_tutorings]
  before_action :authenticate_user!, only: [:show]

  swagger_controller :users, 'Users Management'

  swagger_api :index do
    summary 'Lists all users'
    response :ok
  end

  swagger_api :show do
    summary 'Show user by id'
    param :header, 'Authorization', :string, :required, 'Authentication token'
    param :path, :id, :string, :required, 'user id'
    response :ok
    response :not_found
  end

  swagger_api :generate_guest do
    summary 'Create a guest-user and response with token and id'
    param :query, :franchise_id, :string, :required, 'franchise id'
    param :query, :club_id, :string, :required, 'club id'
    response 201
    response 500
  end

  swagger_api :send_password_via_sms do
    summary 'Send password to user by SMS'
    param :query, :mobile, :string, :required, 'user mobile'
    response :ok
    response :not_found
    response :internal_server_error
  end

  swagger_api :authenticate do
    summary 'Get users Token by mobile and password'
    param :query, :mobile, :string, :required, 'user mobile'
    param :query, :password, :string, :required, 'user password'
    response :ok
    response :not_found
    response :internal_server_error
    response :unauthorized
  end

  def send_password_via_sms
    begin
      user = User.find_by mobile: params[:mobile]
      user.generate_password
      begin user.send_password_via_sms
        render status: :ok, json: "{}"
      rescue
        render status: :internal_server_error, json: "{}"
      end
    rescue
      render status: :not_found, json: "{}"
    end
  end

  def generate_guest
    @user = User.new
    @club = Club.find params[:club_id]
    @franchise = Franchise.find params[:franchise_id]
    @user.clubs << @club
    @user.franchise = @franchise
    if @user.save!
      data = {
          token: @user.authentication_token,
          user_id: @user.id.to_s
      }
      render json: data, status: :ok
    else
      head 500
    end
  end

  def authenticate
    user = User.find_by(mobile: params[:mobile])
    if user.nil?
      head 404
    else
      if user.valid_password?(params[:password])
        data = {
            token: user.authentication_token,
            user_id: user.id.to_s,
            login: user.login
        }
        render json: data, status: :ok
      else
        head 401
      end
    end
  end

  private
    def set_user
      @user = User.find params[:id]
    end
end
