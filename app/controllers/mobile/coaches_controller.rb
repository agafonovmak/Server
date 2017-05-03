class Mobile::CoachesController < Mobile::BaseController
  swagger_controller :coaches, 'Coaches Management'

  swagger_api :index do
    summary 'Lists all coaches'
    response :ok
  end

  swagger_api :show do
    summary 'Show coach by id'
    param :path, :id, :string, :required, 'coach id'
    response :ok
  end

end
