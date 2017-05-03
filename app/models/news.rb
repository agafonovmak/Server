class News
  include Mongoid::Document
  include Mongoid::Timestamps
  include AASM
  extend Enumerize

  default_scope  { order(created_at: :desc) }
  scope :is_on_slider, -> { where(is_on_slider: true) }

  after_create :check_publication_date

  TYPES = [:offer, :default]

  field :title
  field :body
  field :youtube_video_url
  field :publication_date, type: DateTime
  field :is_on_slider,     type: Boolean, default: false
  field :sharing_url
  field :type
  field :aasm_state

  belongs_to :club
  belongs_to :user
  mount_uploader :file, ::News::PhotoUploader

  aasm do
    state :active
    state :waiting, initial: true
    state :archived
    event :set_as_active do
      transitions from: [:waiting, :archived], to: :active
    end
    event :set_as_waiting do
      transitions from: [:active, :archived], to: :waiting
    end
    event :move_to_archive do
      transitions from: [:active, :waiting], to: :archived
    end
  end

  enumerize :type, in: TYPES, default: :default

  def check_publication_date
    if self.publication_date.nil?
      self.set_as_active
      self.save!
    else
      ActivateNewsJob.set(wait_until: self.publication_date).perform_later(self.id.to_s)
    end
  end

end
