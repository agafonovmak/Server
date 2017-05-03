class Mobile::PushTopicsController < Mobile::BaseController
  before_action :authenticate_user!

  swagger_controller :push_topics, 'Push Topics Management'

  swagger_api :index do
    summary 'Lists all push topics'
    param :header, 'Authorization', :string, :required, 'Authentication token'
    response :ok
  end

  swagger_api :show do
    summary 'Show push topic by id'
    param :header, 'Authorization', :string, :required, 'Authentication token'
    param :path, :id, :string, :required, 'push topic id'
    response :ok
  end

end
