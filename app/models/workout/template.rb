class Workout::Template
  include Mongoid::Document

  field :name
  field :description
  field :duration,    type: Integer
  field :seats_count, type: Integer
  field :gym
  field :share_url
  field :is_need_manager_confirm, type: Boolean, default: false

  belongs_to :club
  has_many :workouts, dependent: :destroy
  has_many :images, class_name: 'Workout::Image', dependent: :destroy
end
