class Mobile::Ticket::TutoringRequestSerializer < Mobile::TicketBaseSerializer
  attributes :repeats_count, :time, :comment

  has_one :coach, serializer: Mobile::CoachSerializer
end
