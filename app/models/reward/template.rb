class Reward::Template
  include Mongoid::Document

  after_create :generate_rewards

  field :name
  field :description
  field :shared_url
  field :level_cost, type: Integer, default: 1
  field :started_rewards_count, type: String
  field :show_in_app, type: Boolean, default: true

  belongs_to :club
  has_many   :rewards,  dependent: :destroy
  mount_uploader :file, ::RewardTemplate::PhotoUploader

  def available_rewards_count
    Reward.where(template: self, aasm_state: 'active').count
  end

  def generate_rewards
    if self.started_rewards_count.present?
      for i in 1..self.started_rewards_count.to_i
        Reward.create(template: self)
      end
    end
  end
end
