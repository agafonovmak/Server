class Club::Image
  include Mongoid::Document
  include Mongoid::Timestamps

  mount_uploader :file, ::Club::PhotoUploader
  belongs_to :club
end
