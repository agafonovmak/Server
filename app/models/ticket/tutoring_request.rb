class Ticket::TutoringRequest < Ticket
  aasm do
    after_all_transitions :log_processing_time

    state :opened, initial: true
    state :closed, before_enter: :create_tutoring
    state :declined
    event :set_as_opened do
      transitions from: [:closed, :declined], to: :opened
    end
    event :close do
      transitions from: [:opened, :declined], to: :closed
    end
    event :decline do
      transitions from: :opened, to: :declined
    end
  end

  field :repeats_count, type: Integer, default: 1
  field :time, type: DateTime
  field :comment
  belongs_to :coach

  def create_tutoring
    Tutoring.create!(user: self.user, coach: self.coach, datetime: self.time, duration: self.repeats_count, club: self.club)
  end
end
