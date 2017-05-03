class Mobile::Ticket::TutoringRequestsController < Mobile::BaseController
  before_action :authenticate_user!

  swagger_controller :tutoring_requests_tickets, 'Tutoring Tickets Management'

  swagger_api :index do
    summary 'Lists all Tutoring Tickets'
    param :header, 'Authorization', :string, :required, 'Authentication token'
    response :ok
  end

  swagger_api :show do
    summary 'Show tutoring ticket by id'
    param :header, 'Authorization', :string, :required, 'Authentication token'
    param :path, :id, :string, :required, 'tutoring ticket id'
    response :ok
  end

  swagger_api :create do
    summary 'Create ticket with attributes'
    param :header, 'Authorization', :string, :required, 'Authentication token'
    param :query, :time,        :string, :required, 'tutoring time'
    param :query, :coach_id,    :string, :required, 'tutoring coach id'
    param :query, :club_id,     :string, :required, 'tutoring club id'
    param :query, :repeats_count, :string, false, 'tutoring repeats count'
    param :query, :comment, :string, false, 'tutoring comment'
    response :ok
    response :not_found
  end

  swagger_api :destroy do
    summary 'Destroy tutoring ticket by id'
    param :header, 'Authorization', :string, :required, 'Authentication token'
    param :path, :id, :string, :required, 'tutoring ticket id'
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
