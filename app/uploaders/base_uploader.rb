class BaseUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  include CarrierWave::ImageOptimizer

  process :optimize

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def store_dir
    "#{Rails.root}/public/system/#{model.id}"
  end
end