class Ember::Ticket::MessagesController < Ember::BaseController
  before_action :authenticate_user!
  before_action :set_ticket, only: [:close]

  def close
    if @ticket.close!
      respond_with @ticket, status: :ok, location: false
    else
      respond_with @ticket, status: :bad_request, location: false
    end
  end

  private
  def set_ticket
    @ticket = Ticket::Message.find params[:id]
  end
end
