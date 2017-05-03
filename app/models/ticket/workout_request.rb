class Ticket::WorkoutRequest < Ticket
  belongs_to :workout, class_name: 'Workout'

  aasm do
    after_all_transitions :log_processing_time

    state :opened, initial: true
    state :closed, before_enter: :add_user_to_workout
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

  def add_user_to_workout
    self.workout.users << self.user
  end
end
