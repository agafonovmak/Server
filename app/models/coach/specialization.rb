class Coach::Specialization
  include Mongoid::Document

  field :name

  belongs_to :coach
end
