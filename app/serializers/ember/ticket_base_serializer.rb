class Ember::TicketBaseSerializer < ActiveModel::Serializer
  attributes :id, :aasm_state, :user_id, :club_id, :created_at, :moderator_comment, :processing_time
end
