class Coach::Education
  include Mongoid::Document

  field :name

  belongs_to :coach
end
