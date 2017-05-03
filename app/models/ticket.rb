class Ticket
  include Mongoid::Document
  include Mongoid::Timestamps
  include AASM


  field :aasm_state
  field :moderator_comment
  field :processing_time, type: DateTime

  belongs_to :user, optional: true
  belongs_to :club

  def log_processing_time
    self.processing_time = DateTime.now
    self.save
  end
end
