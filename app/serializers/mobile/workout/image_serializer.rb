class Mobile::Workout::ImageSerializer < ActiveModel::Serializer
  attributes :file_url

  def file_url
    if @object.file.file.try(:size).present?
      @object.file.url
    else
      'default.png'
    end
  end

end