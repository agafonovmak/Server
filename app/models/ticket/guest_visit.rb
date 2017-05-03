class Ticket::GuestVisit < Ticket
  field :mobile
  field :email
  field :name
  field :comment

  aasm do
    after_all_transitions :log_processing_time

    state :opened, initial: true
    state :closed
    event :set_as_open do
      transitions from: [:closed], to: :opened
    end
    event :close do
      transitions from: [:opened], to: :closed
    end
  end
end
