class Mobile::Qr::TemplateSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :score, :cooldown
end
