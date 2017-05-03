class Service::Image
  include Mongoid::Document
  include Mongoid::Timestamps

  mount_uploader :file, ::Service::PhotoUploader
  embedded_in :service
end
