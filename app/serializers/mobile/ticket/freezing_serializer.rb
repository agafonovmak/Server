class Mobile::Ticket::FreezingSerializer < Mobile::TicketBaseSerializer
  attributes :from, :to, :card_id
end
