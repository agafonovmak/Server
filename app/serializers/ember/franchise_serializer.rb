class Ember::FranchiseSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :club_ids,  :first_level_min_score, :second_level_min_score,
             :third_level_min_score, :fourth_level_min_score, :fifth_level_min_score, :card_expiration_date_notify_days_count
end
