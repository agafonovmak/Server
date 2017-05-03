class Ember::History::RewardSerializer < ActiveModel::Serializer
  attributes :id, :type, :datetime, :franchise_id, :club_id, :reward_template_id, :client_id
end
