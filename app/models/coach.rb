class Coach
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name
  field :share_url
  field :conducting_personal, type: Boolean, default: false
  field :conducting_group,    type: Boolean, default: false

  belongs_to :club
  has_and_belongs_to_many :workouts
  has_many :tutorings,         dependent: :destroy
  has_many :training_packages, dependent: :destroy

  has_many :coach_educations,      class_name: 'Coach::Education',      dependent: :destroy
  has_many :coach_achievements,    class_name: 'Coach::Achievement',    dependent: :destroy
  has_many :coach_specializations, class_name: 'Coach::Specialization', dependent: :destroy

  mount_uploader :image, ::Coach::PhotoUploader
end
