class Coach::Achievement
  include Mongoid::Document

  field :name

  belongs_to :coach
end
