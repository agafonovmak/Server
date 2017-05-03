class Mobile::FranchisesController < Mobile::BaseController

  swagger_controller :franchises, 'Franchises Management'

  swagger_api :index do
    summary 'Lists all franchises'
    param :header, 'Authorization', :string, :required, 'Authentication token'
    response :ok
  end

  swagger_api :show do
    summary 'Show franchise by id'
    param :header, 'Authorization', :string, :required, 'Authentication token'
    param :path, :id, :string, :required, 'franchise id'
    response :ok
  end

end
