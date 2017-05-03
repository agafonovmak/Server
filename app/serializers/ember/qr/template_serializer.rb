class Ember::Qr::TemplateSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :score, :cooldown, :franchise_id
end
