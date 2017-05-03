class Ember::TrainingPackageSerializer < ActiveModel::Serializer
  attributes :id, :name, :training_count, :price, :club_id
end
