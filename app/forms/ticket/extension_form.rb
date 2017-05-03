class Ticket
  class ExtensionForm < Reform::Form
    property :card_id
    property :user_id
    property :club_id
    property :aasm_state
    property :moderator_comment

    validates :card_id, :user_id, :club_id, presence: true
  end
end
