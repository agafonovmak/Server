class Ticket
  class WorkoutRequestForm < Reform::Form
    property :user_id
    property :club_id
    property :workout_id
    property :aasm_state
    property :moderator_comment

    validates :user_id, :club_id, :workout_id, presence: true
  end
end
