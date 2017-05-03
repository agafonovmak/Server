class Mobile::Ticket::GuestVisitSerializer < Mobile::TicketBaseSerializer
  attributes :email, :mobile, :name, :comment
end
