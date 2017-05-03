class Ticket::Extension < Ticket

  belongs_to :card, class_name: 'Card'

  aasm do
    after_all_transitions :log_processing_time

    state :opened, initial: true
    state :closed
    state :declined
    event :set_as_open do
      transitions from: [:closed, :declined], to: :opened
    end
    event :close do
      transitions from: [:opened, :declined], to: :closed
    end
    event :decline do
      transitions from: :opened, to: :declined
    end
  end
end
