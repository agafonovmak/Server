class Mobile::TrainingPackageSerializer < ActiveModel::Serializer
  attributes :name, :training_count, :price
end
