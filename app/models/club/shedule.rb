class Club::Shedule
  include Mongoid::Document
  include Mongoid::Timestamps

  field :weekdays_time_start, default: '07-00'
  field :weekdays_time_stop,  default: '23-00'
  field :weekend_time_start,  default: '09-00'
  field :weekend_time_stop,   default: '23-00'

  belongs_to :club
end
