class Ember::NewsSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :type, :aasm_state, :youtube_video_url, :publication_date,
             :is_on_slider, :sharing_url, :image_url, :image_thumb_url, :club_id, :user_id

  def image_url
    if @object.file.file.try(:size).present?
      Rails.application.config.host + @object.file.url
    else
      nil
    end
  end

  def image_thumb_url
    if @object.file.file.try(:size).present?
      Rails.application.config.host + @object.file.url(:thumb)
    else
      nil
    end
  end

  def publication_date
    if @object.publication_date.present?
      @object.publication_date
    else
      @object.created_at
    end
  end

end
