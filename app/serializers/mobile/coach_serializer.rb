class Mobile::CoachSerializer < ActiveModel::Serializer
  attributes :id, :name, :share_url, :conducting_personal, :conducting_group, :club_id, :image_url

  has_many :coach_educations,      serializer: Mobile::Coach::EducationSerializer
  has_many :coach_achievements,    serializer: Mobile::Coach::AchievementSerializer
  has_many :coach_specializations, serializer: Mobile::Coach::SpecializationSerializer

  def image_url
    if @object.image.file.try(:size).present?
      @object.image.url
    else
      'default.png'
    end
  end
end
