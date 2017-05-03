class Mobile::Ticket::RecallSerializer < Mobile::TicketBaseSerializer
  attributes :reason, :mobile, :comment
end
