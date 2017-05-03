class Mobile::Service::ImageSerializer < ActiveModel::Serializer
  attributes :id, :file_url, :thumb_url

  def file_url
    if @object.file.file.try(:size).present?
      @object.file.url
    else
      'default.png'
    end
  end

  def thumb_url
    if @object.file.file.try(:size).present?
      @object.file.url(:thumb)
    else
      'default.png'
    end
  end
end