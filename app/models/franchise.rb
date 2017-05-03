class Franchise
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name
  field :description

  field :first_level_min_score,  type: Integer, default: 100
  field :second_level_min_score, type: Integer, default: 200
  field :third_level_min_score,  type: Integer, default: 300
  field :fourth_level_min_score, type: Integer, default: 400
  field :fifth_level_min_score,  type: Integer, default: 500

  field :card_expiration_date_notify_days_count, type: Integer

  has_many :clubs,                     dependent: :destroy
  has_many :loyalties,                 dependent: :destroy
  has_many :users,                     dependent: :destroy
  has_many :qr_templates,              dependent: :destroy, class_name: 'Qr::Template'
  has_many :qrs,                       dependent: :destroy
  has_many :score_rules,               dependent: :destroy
  has_many :services, as: :servicable, dependent: :destroy
end
