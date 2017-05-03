class Ember::Ticket::TutoringRequestsController < Ember::BaseController
  before_action :authenticate_user!
  before_action :set_ticket, only: [:close, :decline]

  def close
    if @ticket.close!
      head :ok
    else
      head :bad_request
    end
  end

  def decline
    if @ticket.decline!
      head :ok
    else
      head :bad_request
    end
  end

  private
  def set_ticket
    @ticket = Ticket::TutoringRequest.find params[:id]
  end
end
