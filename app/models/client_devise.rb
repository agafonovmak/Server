class ClientDevise
  include Mongoid::Document
  extend Enumerize

  TYPES = [:ios, :android]

  field :token

  enumerize :os_type, in: TYPES

  belongs_to :user
  has_and_belongs_to_many :pushes
end
