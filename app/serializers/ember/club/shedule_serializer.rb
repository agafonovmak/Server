class Ember::Club::SheduleSerializer < ActiveModel::Serializer
  attributes :id, :weekdays_time_start, :weekdays_time_stop, :weekend_time_start, :weekend_time_stop, :club_id
end
