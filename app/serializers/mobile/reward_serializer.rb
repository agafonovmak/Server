class Mobile::RewardSerializer < ActiveModel::Serializer
  attributes :id, :aasm_state, :user_id

  has_one :template, serializer: Mobile::Reward::TemplateSerializer
end
