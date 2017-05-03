class Mobile::NewsController < Mobile::BaseController

  swagger_controller :news, 'News Management'

  swagger_api :index do
    summary 'Lists all news'
    response :ok
  end

  swagger_api :show do
    summary 'Show news by id'
    param :path, :id, :string, :required, 'news id'
    response :ok
  end

end
