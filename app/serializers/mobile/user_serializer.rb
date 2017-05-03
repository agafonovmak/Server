class Mobile::UserSerializer < ActiveModel::Serializer
  attributes :id, :name,  :email, :mobile, :club_ids, :franchise_id, :tutoring_ids, :workout_ids,
             :ticket_recall_ids, :ticket_freezing_ids, :ticket_extension_ids, :ticket_message_ids, :waiting_reward_ids,
             :issued_reward_ids, :age

  has_one :loyalty, serializer: Mobile::LoyaltySerializer
  has_one :card,    serializer: Mobile::CardSerializer

  def waiting_reward_ids
    @object.rewards.waiting.pluck(:id)
  end

  def issued_reward_ids
    @object.rewards.issued.pluck(:id)
  end
end
