class Mobile::Ticket::RecallsController < Mobile::BaseController
  before_action :authenticate_user!

  swagger_controller :recalls_tickets, 'Recall Tickets Management'

  swagger_api :index do
    summary 'Lists all Recall Tickets'
    response :ok
  end

  swagger_api :show do
    summary 'Show recall ticket by id'
    param :path, :id, :string, :required, 'recall ticket id'
    response :ok
  end

  swagger_api :create do
    summary 'Create ticket with attributes'
    param :header, 'Authorization', :string, :required, 'Authentication token'
    param :query, :reason,  :string, :required, 'recall reason'
    param :query, :mobile,  :string, :required, 'recall mobile'
    param :query, :name,    :string, :required, 'recall name'
    param :query, :club_id, :string, :required, 'recall club id'
    param :query, :comment, :string, false,     'recall comment'
    response :ok
    response :not_found
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
