class Ember::ScheduleWorkoutSerializer < ActiveModel::Serializer
  attributes :id, :aasm_state, :user_ids, :cancel_reason, :status, :available_seats_count, :club_id,
             :type_id, :template_id, :coach_ids, :price, :name, :description, :duration, :seats_count, :gym, :share_url,
             :is_need_manager_confirm, :day_name, :day, :time, :schedule_template_id

  def available_seats_count
    @object.available_seats_count
  end
end
