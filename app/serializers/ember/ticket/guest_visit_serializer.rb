class Ember::Ticket::GuestVisitSerializer < Ember::TicketBaseSerializer
  attributes :mobile, :email, :name, :comment
end
