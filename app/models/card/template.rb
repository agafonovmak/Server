class Card::Template
  include Mongoid::Document
  after_create :copy_services

  field :name
  field :free_freezing_days_count, type: Integer

  belongs_to :club
  has_many   :cards, dependent: :destroy
  has_many   :services, as: :servicable, dependent: :destroy

  def copy_services
    self.club.services.each do |service|
      copy_service = service.clone
      copy_service.servicable = self
      copy_service.save!
    end
  end
end
