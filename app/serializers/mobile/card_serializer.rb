class Mobile::CardSerializer < ActiveModel::Serializer
  attributes :id, :aasm_state, :expiration_date, :user_id, :club_id, :number
  has_one  :template, serializer: Mobile::Card::TemplateSerializer
end
