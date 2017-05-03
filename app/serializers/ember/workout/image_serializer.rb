class Ember::Workout::ImageSerializer < ActiveModel::Serializer
  attributes :id, :file_url

  def file_url
    if @object.file.file.try(:size).present?
      Rails.application.config.host + @object.file.url
    else
      Rails.application.config.host + 'default.png'
    end
  end

end