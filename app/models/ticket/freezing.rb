class Ticket::Freezing < Ticket
  field :from, type: DateTime
  field :to,   type: DateTime

  belongs_to :card, class_name: 'Card'

  aasm do
    after_all_transitions :log_processing_time

    state :opened, initial: true
    state :closed, after_enter: :freeze_card
    state :declined
    event :set_as_open do
      transitions from: [:closed, :declined], to: :opened
    end
    event :close do
      transitions from: [:opened, :declined], to: :closed
    end
    event :decline do
      transitions from: :opened, to: :decline
    end
  end

  def freeze_card
    @card = self.card
    @card.expiration_date += self.to - self.from
    @card.save
    @card.set_as_frozen!
  end
end
