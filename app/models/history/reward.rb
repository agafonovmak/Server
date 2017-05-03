class History::Reward
  include Mongoid::Document
  extend Enumerize

  TYPES = [:issued, :waiting, :active]

  field :datetime, type: DateTime

  enumerize :type, in: TYPES, default: :waiting

  belongs_to :franchise
  belongs_to :club
  belongs_to :reward_template, class_name: 'Reward::Template'

  belongs_to :client,  class_name: 'User', inverse_of: :history_rewards
  belongs_to :manager, class_name: 'User', inverse_of: :history_rewards, optional: true

end
