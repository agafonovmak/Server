class QrForm < Reform::Form
  property :name
  property :description
  property :user_max_charges
  property :start_time
  property :end_time
  property :template_id

  validates :name, :description, :user_max_charges, :start_time, :end_time, :template_id, presence: true
end
