class Mobile::QrSerializer < ActiveModel::Serializer
  attributes :id, :name, :charge_count, :user_max_charges, :start_time, :end_time, :last_charge, :code_url

  has_one :template, serializer: Mobile::Qr::TemplateSerializer
end
