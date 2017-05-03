class Ember::ScheduleTemplateSerializer < ActiveModel::Serializer
  attributes :id, :name, :club_id, :schedule_workout_ids
end
