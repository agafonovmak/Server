class Workout::Image
  include Mongoid::Document
  include Mongoid::Timestamps

  mount_uploader :file, ::Workout::PhotoUploader
  belongs_to :template, class_name: 'Workout::Template'
end
