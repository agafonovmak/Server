class Mobile::TutoringSerializer < ActiveModel::Serializer
  attributes :id, :duration, :gym, :aasm_state, :datetime, :user_id, :club_id

  has_one :coach, serializer: Mobile::CoachSerializer
end
