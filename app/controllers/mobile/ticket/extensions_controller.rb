class Mobile::Ticket::ExtensionsController < Mobile::BaseController
  before_action :authenticate_user!

  swagger_controller :extensions_tickets, 'Extension Tickets Management'

  swagger_api :index do
    summary 'Lists all Extension Tickets'
    param :header, 'Authorization', :string, :required, 'Authentication token'
    response :ok
  end

  swagger_api :show do
    summary 'Show extension ticket by id'
    param :header, 'Authorization', :string, :required, 'Authentication token'
    param :path, :id, :string, :required, 'extension ticket id'
    response :ok
  end

  swagger_api :create do
    summary 'Create ticket with attributes'
    param :header, 'Authorization', :string, :required, 'Authentication token'
    param :query, :club_id, :string, :required, 'freezing token club id'
    param :query, :card_id, :string, :required, 'freezing token card id'
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
