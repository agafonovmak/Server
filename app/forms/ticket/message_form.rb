class Ticket
  class MessageForm < Reform::Form
    property :email
    property :text
    property :mobile
    property :club_id
    property :aasm_state
    property :moderator_comment

    validates :mobile, :text, :club_id, presence: true
  end
end
