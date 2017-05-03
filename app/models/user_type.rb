class UserType
  include Mongoid::Document
  after_save :update_users

  field :name
  field :description

  belongs_to :club, optional: true
  has_and_belongs_to_many :roles
  has_many :users

  def update_users
    if role_ids_changed?
      self.users.each do |user|
        user.roles = []
        self.roles.each do |role|
          user.roles << role
        end
        user.save
      end
    end
  end
end
