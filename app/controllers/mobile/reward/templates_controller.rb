class Mobile::Reward::TemplatesController < Mobile::BaseController
  before_action :authenticate_user!

  swagger_controller :coaches, 'Reward Templates Management'

  swagger_api :index do
    summary 'Lists all reward templates'
    param :header, 'Authorization', :string, :required, 'Authentication token'
    response :ok
  end

  swagger_api :show do
    summary 'Show reward template by id'
    param :header, 'Authorization', :string, :required, 'Authentication token'
    param :path, :id, :string, :required, 'coach id'
    response :ok
  end

end
