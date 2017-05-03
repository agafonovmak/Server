class Ember::WorkoutSerializer < ActiveModel::Serializer
  attributes :id, :datetime, :aasm_state, :user_ids, :cancel_reason, :status, :available_seats_count, :club_id,
             :type_id, :template_id, :coach_ids, :price, :name, :description, :duration, :seats_count, :gym, :share_url,
             :is_need_manager_confirm, :start, :end, :title

  def available_seats_count
    @object.available_seats_count
  end

  def start
    @object.datetime
  end

  def title
    @object.name
  end

  def end
    @object.datetime + @object.try(:duration).to_i.minutes
  end

  def datetime
    @object.datetime.strftime("%d.%m.%Y %H:%M")
  end
end
