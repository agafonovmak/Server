class Club
  include Mongoid::Document
  include Mongoid::Timestamps

  after_create :generate_shedule, :copy_services

  field :name
  field :description
  field :phone
  field :address
  field :website_link
  field :vk_link
  field :twitter_link
  field :facebook_link
  field :instagram_link

  belongs_to              :franchise
  has_and_belongs_to_many :users
  has_many                :workouts, dependent: :destroy
  has_one                 :club_shedule,       class_name: 'Club::Shedule', dependent: :destroy
  has_many                :club_images,        class_name: 'Club::Image'
  has_many                :ticket_recalls,    class_name: 'Ticket::Recall',    dependent: :destroy
  has_many                :ticket_freezings,  class_name: 'Ticket::Freezing',  dependent: :destroy
  has_many                :ticket_extensions, class_name: 'Ticket::Extension', dependent: :destroy
  has_many                :ticket_messages,   class_name: 'Ticket::Message',   dependent: :destroy
  has_many                :news,                                               dependent: :destroy
  has_many                :coaches
  has_many                :tutorings, dependent: :destroy
  has_many                :cards,     dependent: :destroy
  has_many                :qrs,       dependent: :destroy
  has_many                :services, as: :servicable, dependent: :destroy
  has_many                :card_templates, class_name: 'Card::Template', dependent: :destroy
  has_many                :training_packages, dependent: :destroy
  has_many :reward_templates, class_name: 'Reward::Template', dependent: :destroy
  has_many :schedule_templates, dependent: :destroy

  def generate_shedule
    Club::Shedule.create(club: self)
  end

  def copy_services
    self.franchise.services.each do |service|
      copy_service = service.clone
      copy_service.servicable = self
      copy_service.save!
    end
  end
end
