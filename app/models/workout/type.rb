class Workout::Type
  include Mongoid::Document

  field :title
  field :description
  has_many :workouts, dependent: :destroy

end
