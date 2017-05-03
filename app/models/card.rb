class Card
  include Mongoid::Document
  include Mongoid::Timestamps
  include AASM

  after_create :set_available_days_count

  field :number
  field :expiration_date, type: DateTime
  field :available_free_freezing_days_count, type: Integer
  field :aasm_state

  aasm do
    state :active, initial: true
    state :inactive
    state :card_frozen
    event :set_as_active do
      transitions from: [:card_frozen, :inactive], to: :active
    end
    event :set_as_inactive do
      transitions from: [:card_frozen, :active], to: :inactive
    end
    event :set_as_frozen do
      transitions from: :active, to: :card_frozen
    end
    event :break_frost do
      transitions from: :card_frozen, to: :active
    end
  end

  belongs_to :user
  belongs_to :club
  belongs_to :template, class_name: 'Card::Template'

  def set_available_days_count
    self.available_free_freezing_days_count = self.template.free_freezing_days_count
    self.save
  end
end
