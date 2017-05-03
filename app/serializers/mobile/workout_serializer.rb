class Mobile::WorkoutSerializer < ActiveModel::Serializer
  attributes :id, :datetime, :aasm_state, :user_ids, :cancel_reason, :status, :available_seats_count, :club_id,
             :type_title, :type_description, :price, :name, :description, :duration, :seats_count, :gym, :share_url,
             :is_need_manager_confirm

  has_one  :template, serializer: Mobile::Workout::TemplateSerializer
  has_many :coaches,  serializer: Mobile::CoachSerializer

  def available_seats_count
    @object.available_seats_count
  end

  def type_title
    @object.type.title
  end

  def type_description
    @object.type.description
  end

end
