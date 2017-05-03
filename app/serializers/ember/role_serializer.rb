class Ember::RoleSerializer < ActiveModel::Serializer
  attributes :id, :name, :russian_name, :type
end
