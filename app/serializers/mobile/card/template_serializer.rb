class Mobile::Card::TemplateSerializer < ActiveModel::Serializer
  attributes :id, :name, :free_freezing_days_count
  has_many :services, serializer: Mobile::ServiceSerializer
end
