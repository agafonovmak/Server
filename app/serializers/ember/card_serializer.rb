class Ember::CardSerializer < ActiveModel::Serializer
  attributes :id, :number, :expiration_date, :available_free_freezing_days_count, :aasm_state, :user_id,
             :club_id, :template_id
end
