class Mobile::Ticket::GuestVisitsController < Mobile::BaseController
  before_action :authenticate_user!

  swagger_controller :guest_visit_tickets, 'Guest Visit Tickets Management'

  swagger_api :index do
    summary 'Lists all Guest Visit Tickets'
    response :ok
  end

  swagger_api :show do
    summary 'Show guest visit ticket by id'
    param :path, :id, :string, :required, 'guest visit ticket id'
    response :ok
  end

  swagger_api :create do
    summary 'Create ticket with attributes'
    param :header, 'Authorization', :string, :required, 'Authentication token'
    param :query, :email,   :string, :required, 'guest visit email'
    param :query, :mobile,  :string, :required, 'guest visit mobile'
    param :query, :name,    :string, :required, 'guest visit name'
    param :query, :club_id, :string, :required, 'guest visit club id'
    param :query, :comment, :string, false,     'guest visit comment'
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
