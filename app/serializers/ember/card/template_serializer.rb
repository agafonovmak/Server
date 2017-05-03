class Ember::Card::TemplateSerializer < ActiveModel::Serializer
  attributes :id, :name, :free_freezing_days_count, :service_ids, :club_id
end
