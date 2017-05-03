class ScoreRuleForm < Reform::Form
  property :name
  property :description
  property :score
  property :franchise_id

  validates :name, :description, :score, :franchise_id, presence: true
end
