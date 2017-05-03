require 'carrierwave/processing/mini_magick'

class Service::PhotoUploader < BaseUploader
  version :thumb do
    process :resize_to_fit => [150, 150]
  end
end
