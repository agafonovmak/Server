require 'exceptions/qr/qr_cooldown_exception'
require 'exceptions/qr/qr_early_charge_exception'
require 'exceptions/qr/qr_late_charge_exception'
require 'exceptions/qr/qr_max_charges_exception'

class Mobile::QrsController < Mobile::BaseController
  before_action :set_qr, only: :charge
  before_action :authenticate_user!

  swagger_controller :qrs, 'QR Management'

  swagger_api :index do
    summary 'Lists all QR'
    param :header, 'Authorization', :string, :required, 'Authentication token'
    response :ok
  end

  swagger_api :show do
    summary 'Show QR by id'
    param :header, 'Authorization', :string, :required, 'Authentication token'
    param :path, :id, :string, :required, 'QR id'
    response :ok
  end

  swagger_api :charge do
    summary 'Charge QR by id'
    param :header, 'Authorization', :string, :required, 'Authentication token'
    param :path, :id, :string, :required, 'QR id'
    response 201
    response :not_found
    response 601, 'QR Early Exception'
    response 602, 'QR Late Exception'
    response 603, 'QR Max Charge Exception'
    response 604, 'QR Cooldown Exception'
  end

  def charge
    begin
      score   = @qr.charge
      loyalty = @current_user.loyalty
      loyalty.score += score
      loyalty.save!
      respond_with @current_user, serializer: Mobile::UserSerializer, location: false
    rescue QrEarlyChargeException
      head 601
    rescue QrLateChargeException
      head 602
    rescue QrMaxChargesException
      head 603
    rescue QrCooldownException
      head 604
    end
  end

  private
    def set_qr
      @qr = Qr.find params[:id]
    end
end
