class Ticket
  class GuestVisitForm < Reform::Form
    property :email
    property :mobile
    property :name
    property :comment
    property :club_id
    property :aasm_state
    property :moderator_comment

    validates :email, :mobile, :name, :club_id, presence: true
  end
end
