class Ticket
  class TutoringRequestForm < Reform::Form
    property :user_id
    property :club_id
    property :aasm_state
    property :moderator_comment
    property :time
    property :comment
    property :repeats_count
    property :coach_id

    validates :user_id, :club_id, :coach_id, :time, presence: true
  end
end
