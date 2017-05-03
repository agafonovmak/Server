class Mobile::LoyaltySerializer < ActiveModel::Serializer
  attributes :id, :score, :level, :user_id, :franchise_id

  def level
    @object.level
  end

end
