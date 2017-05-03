class Mobile::Ticket::MessagesController < Mobile::BaseController
  before_action :authenticate_user!

  swagger_controller :message_tickets, 'Message Tickets Management'

  swagger_api :index do
    summary 'Lists all Message Tickets'
    response :ok
  end

  swagger_api :show do
    summary 'Show message ticket by id'
    param :path, :id, :string, :required, 'message ticket id'
    response :ok
  end

  swagger_api :create do
    summary 'Create ticket with attributes'
    param :header, 'Authorization', :string, :required, 'Authentication token'
    param :query, :email,   :string, false, 'message email'
    param :query, :mobile,  :string, :required, 'message mobile'
    param :query, :text,    :string, :required, 'message text'
    param :query, :club_id, :string, :required, 'message club id'
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
