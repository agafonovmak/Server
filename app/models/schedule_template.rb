class ScheduleTemplate
  include Mongoid::Document

  field :name

  belongs_to :club
  has_many :schedule_workouts, dependent: :destroy

end
