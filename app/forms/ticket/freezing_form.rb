class Ticket
  class FreezingForm < Reform::Form
    property :from
    property :to
    property :card_id
    property :club_id
    property :aasm_state
    property :moderator_comment

    validates :from, :to, :card_id, :club_id, presence: true
  end
end
