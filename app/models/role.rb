class Role
  extend Enumerize
  include Mongoid::Document
  has_and_belongs_to_many :users
  belongs_to :resource, polymorphic: true, optional: true
  has_and_belongs_to_many :user_types
  field :name, :type => String

  field      :russian_name, type: String

  TYPES = [:writer, :reader, :default]

  index({
    :name => 1,
    :resource_type => 1,
    :resource_id => 1
  },
  { :unique => true})

  enumerize :type, in: TYPES, default: :default

  validates :resource_type,
            :inclusion => { :in => Rolify.resource_types },
            :allow_nil => true

  scopify
end
