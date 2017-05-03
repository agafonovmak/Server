class ScheduleWorkout
  include Mongoid::Document
  include Mongoid::Timestamps
  include AASM
  extend Enumerize

  TYPES = [:default, :new, :hot, :best]

  field :datetime, type: DateTime
  field :aasm_state
  field :cancel_reason
  field :price, type: Integer, default: 0
  field :day_name
  field :day
  field :time

  field :name
  field :description
  field :duration,    type: Integer
  field :seats_count, type: Integer
  field :gym
  field :share_url
  field :is_need_manager_confirm, type: Boolean, default: false

  enumerize :status, in: TYPES, default: :new

  aasm do
    state :active, initial: true

    state :canceled
    state :archived
    event :active do
      transitions from: :active, to: :archived
    end
    event :cancel do
      transitions from: :active, to: :canceled
    end
  end

  def available_seats_count
    @users_count = self.users.count | 0
    self.template.seats_count - @users_count
  end

  belongs_to :club
  belongs_to :template, class_name: 'Workout::Template'
  belongs_to :type,     class_name: 'Workout::Type'
  belongs_to :schedule_template

  has_and_belongs_to_many :coaches
  has_and_belongs_to_many :users
end
