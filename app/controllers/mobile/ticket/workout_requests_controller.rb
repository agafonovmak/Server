class Mobile::Ticket::WorkoutRequestsController < Mobile::BaseController
  before_action :authenticate_user!

  swagger_controller :workout_requests_tickets, 'Workout Tickets Management'

  swagger_api :index do
    summary 'Lists all Workout Tickets'
    param :header, 'Authorization', :string, :required, 'Authentication token'
    response :ok
  end

  swagger_api :show do
    summary 'Show workout ticket by id'
    param :header, 'Authorization', :string, :required, 'Authentication token'
    param :path, :id, :string, :required, 'workout ticket id'
    response :ok
  end

  swagger_api :create do
    summary 'Create ticket with attributes'
    param :header, 'Authorization', :string, :required, 'Authentication token'
    param :query, :club_id,    :string, :required, 'workout club id'
    param :query, :workout_id, :string, :required, 'workout id'
    response :ok
    response :not_found
  end

  swagger_api :destroy do
    summary 'Destroy workout ticket by id'
    param :header, 'Authorization', :string, :required, 'Authentication token'
    param :path, :id, :string, :required, 'workout ticket id'
    response :ok
  end

  def create
    build_item
    authorize(@item)
    @item.user = @current_user
    form = get_form
    if form.present?
      if form.validate(permitted_params)
        form.save
      else
        return respond_with(form)
      end
    else
      @item.save
    end
    yield(@item) if block_given?
    respond_with(@item, serializer: serializer, location: false, root: root_name)
  end

end
