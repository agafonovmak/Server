class Mobile::Workout::TemplateSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :duration, :seats_count, :gym, :share_url, :is_need_manager_confirm,
             :club_id

  has_many :images,   serializer: Mobile::Workout::ImageSerializer
end

