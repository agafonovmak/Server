class Service
  include Mongoid::Document

  field :name
  field :description
  field :price
  field :icon_number, type: Integer

  belongs_to :servicable, polymorphic: true, optional: true

  embeds_one :image, class_name: 'Service::Image', cascade_callbacks: true
  accepts_nested_attributes_for :image
end
