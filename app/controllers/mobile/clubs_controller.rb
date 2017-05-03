class Mobile::ClubsController < Mobile::BaseController
  swagger_controller :clubs, 'Clubs Management'

  swagger_api :index do
    summary 'Lists all clubs'
    response :ok
  end

  swagger_api :show do
    summary 'Show club by id'
    param :path, :id, :string, :required, 'club id'
    response :ok
  end

end
