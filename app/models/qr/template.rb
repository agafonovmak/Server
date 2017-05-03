class Qr::Template
  include Mongoid::Document

  field :name
  field :description

  field :score,         type: Integer
  field :cooldown,      type: Integer

  belongs_to :franchise
  has_many   :qrs, dependent: :destroy
end
