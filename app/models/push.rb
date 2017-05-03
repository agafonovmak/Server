require 'gcm'

class Push
  include Mongoid::Document
  include AASM

  after_create :check_delivery_date

  field :text
  field :aasm_state
  field :delivery_date, type: DateTime

  has_and_belongs_to_many :client_devises

  aasm do
    state :created, initial: true
    state :pushed
    state :waiting
    event :send_push do
      transitions from: [:waiting, :created], to: :pushed
    end
  end

  def check_delivery_date
    if self.delivery_date.nil?
      self.send_to_devices
    else
      SendPushJob.set(wait_until: self.delivery_date).perform_later(self.id.to_s)
    end
  end

  def send_to_devices
    registration_ids = []
    self.client_devises.each do |devise|
      registration_ids << devise.id.to_s
    end
    gcm = GCM.new(Rails.application.secrets.gcm_api_key)
    options = {data: {text: self.text}}
    response = gcm.send(registration_ids, options)
    self.send_push!
  end

end
