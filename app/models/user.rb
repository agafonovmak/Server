class User
  include Mongoid::Document
  include Mongoid::Timestamps
  rolify
  devise :database_authenticatable, :trackable

  scope :not_clients, -> {where(:id.nin => User.with_role(:client).pluck(:id))}

  before_save   :ensure_authentication_token
  after_create  :create_loyalty
  after_create  :assign_default_role
  after_create  :assign_selected_club
  after_save    :assign_roles

  field :old_user_type_id, default: nil
  field :age, type: Integer, default: 0

  ## Database authenticatable
  field :email,              type: String, default: ''
  field :encrypted_password, type: String, default: ''

  ## Trackable
  field :sign_in_count,      type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip,    type: String

  field :name
  field :mobile
  field :authentication_token
  field :last_sms_request,   type: DateTime

  belongs_to              :franchise, optional: true
  belongs_to              :selected_club,         class_name: 'Club',                      optional: true
  has_one                 :card,                                                           dependent: :destroy
  has_and_belongs_to_many :clubs
  has_one                 :loyalty,                                                        dependent: :destroy
  has_many                :ticket_recalls,        class_name: 'Ticket::Recall',            dependent: :destroy
  has_many                :ticket_freezings,      class_name: 'Ticket::Freezing',          dependent: :destroy
  has_many                :ticket_extensions,     class_name: 'Ticket::Extension',         dependent: :destroy
  has_many                :ticket_messages,       class_name: 'Ticket::Message',           dependent: :destroy
  has_many                :ticket_tutorings,      class_name: 'Ticket::TutoringRequest',   dependent: :destroy
  has_many                :ticket_workouts,       class_name: 'Ticket::WorkoutRequest',    dependent: :destroy
  has_many                :tutorings,                                                      dependent: :destroy
  has_many                :rewards
  has_and_belongs_to_many :workouts
  has_many                :client_devises,                                                 dependent: :destroy
  has_many                :news

  has_many :history_rewards, class_name: 'History::Reward', inverse_of: :client, dependent: :destroy
  has_many :history_rewards, class_name: 'History::Reward', inverse_of: :manager

  belongs_to              :user_type, optional: true

  def current_roles_list
    roles.map(&:name)
  end

  def assign_roles
    if self.user_type.present?
      if old_user_type_id.nil? || (old_user_type_id != self.user_type_id)
        self.roles = []
        self.user_type.roles.each do |role|
          self.roles << role
        end
        self.old_user_type_id = self.user_type_id
        self.save
      end
    end
  end

  def assign_selected_club
    if self.selected_club.blank?
      self.selected_club = self.clubs.first
      self.save!
    end
  end

  def generate_password
    generated_password = sprintf('%04d', rand(9999))
    self.password = generated_password
    self.save!
    generated_password
  end

  def send_password_via_sms
    if self.last_sms_request.present? && ((DateTime.now - self.last_sms_request) * 24 * 60 ).to_i <= 5
      raise SendSMSException
    else
      sms = Smsc::Sms.new(Rails.application.secrets.smsc_login, Rails.application.secrets.smsc_password)
      sms.message(self.password.to_s, [self.mobile.to_s])
      self.last_sms_request = DateTime.now
      self.save!
    end
  end

  def create_loyalty
    if self.franchise.present?
      Loyalty.create(franchise: self.franchise, user: self)
    end
  end

  def assign_default_role
    self.add_role(:client) if self.roles.blank?
  end

  def login=(login)
    @login = login
  end

  def login
    if self.mobile.present?
      self.mobile
    else
      self.email
    end
  end

  def is_client
    (self.roles.size == 1) && (self.has_role? :client)
  end

  def is_owner
    self.has_role? :fitclubs_administrator
  end

  def is_admin
    self.has_role? :franchise_administrator
  end

  private
  def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end

  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end
  end
end
