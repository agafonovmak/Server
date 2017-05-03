class Reward
  include Mongoid::Document
  include AASM

  field :aasm_state

  aasm do
    state :active, initial: true
    state :waiting, after_enter: :update_user_score
    state :issued
    event :set_as_active do
      transitions from: [:waiting, :issued], to: :active
    end
    event :set_as_waiting do
      transitions from: [:active, :issued], to: :waiting
    end
    event :move_to_issued do
      transitions from: :waiting, to: :issued
    end
  end

  def update_user_score
    case self.template.level_cost
      when 1
        self.user.loyalty.score -= self.template.club.franchise.first_level_min_score
      when 2
        self.user.loyalty.score -= self.template.club.franchise.second_level_min_score
      when 3
        self.user.loyalty.score -= self.template.club.franchise.third_level_min_score
      when 4
        self.user.loyalty.score -= self.template.club.franchise.fourth_level_min_score
      else
        self.user.loyalty.score -= self.template.club.franchise.fifth_level_min_score
    end
    self.user.loyalty.save
  end

  belongs_to :template, class_name: 'Reward::Template'
  belongs_to :user, optional: true

  has_many :history_rewards, class_name: 'History::Reward', dependent: :destroy
end
