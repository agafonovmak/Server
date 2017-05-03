class ScoreRule
  include Mongoid::Document

  field :name
  field :score, type: Integer

  belongs_to :franchise
end
