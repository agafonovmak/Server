class Mobile::ServiceSerializer < ActiveModel::Serializer
  attributes :name, :description, :price, :icon_number

  has_one :image, serializer: Mobile::Service::ImageSerializer
end
