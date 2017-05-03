class Ember::UserTypeSerializer < ActiveModel::Serializer
  attributes :id, :name,  :role_ids, :club_id, :description
end
