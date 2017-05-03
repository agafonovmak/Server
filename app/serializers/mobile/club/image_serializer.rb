class Mobile::Club::ImageSerializer < ActiveModel::Serializer
  attributes :file_url, :thumb_url

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