class Ember::CoachSerializer < ActiveModel::Serializer
  attributes :id, :name, :share_url, :conducting_personal, :conducting_group,
             :club_id, :image_url, :coach_education_ids, :coach_achievement_ids, :coach_specialization_ids

  def image_url
    if @object.image.file.try(:size).present?
      Rails.application.config.host + @object.image.url
    else
      nil
    end
  end
end
