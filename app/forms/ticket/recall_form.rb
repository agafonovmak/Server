class Ticket
  class RecallForm < Reform::Form
    property :reason
    property :mobile
    property :club_id
    property :aasm_state
    property :moderator_comment
    property :comment

    validates :reason, :mobile, :club_id, presence: true
  end
end
