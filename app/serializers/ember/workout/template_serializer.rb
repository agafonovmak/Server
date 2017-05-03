class Ember::Workout::TemplateSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :duration, :seats_count, :gym, :share_url, :is_need_manager_confirm,
             :club_id, :image_ids
end
