class Tutoring
  include Mongoid::Document
  include Mongoid::Timestamps
  include AASM

  field :duration, type: Integer
  field :gym
  field :aasm_state
  field :datetime, type: DateTime, default: DateTime.now

  aasm do
    state :new, initial: true
    state :approved
    state :canceled
    event :approve do
      transitions from: :new, to: :approved
    end
    event :cancel do
      transitions from: [:new, :approved], to: :canceled
    end
  end

  belongs_to :user
  belongs_to :coach
  belongs_to :club
end
