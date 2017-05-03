class Mobile::TutoringsController < Mobile::BaseController
  before_action :authenticate_user!

  swagger_controller :tutorings, 'Tutorings Management'

  swagger_api :index do
    summary 'Lists all tutorings'
    param :header, 'Authorization', :string, :required, 'Authentication token'
    response :ok
  end

  swagger_api :show do
    summary 'Show tutoring by id'
    param :header, 'Authorization', :string, :required, 'Authentication token'
    param :path, :id, :string, :required, 'tutoring id'
    response :ok
  end

  swagger_api :destroy do
    summary 'Destroy tutoring by id'
    param :header, 'Authorization', :string, :required, 'Authentication token'
    param :path, :id, :string, :required, 'tutoring id'
    response :ok
  end

end
