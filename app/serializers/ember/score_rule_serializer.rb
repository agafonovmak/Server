class Ember::ScoreRuleSerializer < ActiveModel::Serializer
  attributes :id, :name, :score, :franchise_id
end
