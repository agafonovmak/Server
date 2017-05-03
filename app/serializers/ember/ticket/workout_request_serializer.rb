class Ember::Ticket::WorkoutRequestSerializer < Ember::TicketBaseSerializer
  attributes :workout_id, :workout_template_name, :available_seats_count, :total_seats_count, :user_id

  def workout_template_name
    @object.workout.template.name
  end

  def total_seats_count
    @object.workout.template.seats_count
  end

  def available_seats_count
    @object.workout.users.count
  end
end
