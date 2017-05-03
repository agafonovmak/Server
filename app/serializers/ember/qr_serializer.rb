class Ember::QrSerializer < ActiveModel::Serializer
  attributes :id, :name, :charge_count, :description, :user_max_charges, :start_time, :end_time, :last_charge,
             :code_url, :qr_template_id


  def qr_template_id
    @object.template.id
  end

  def code_url
    if Rails.env.development?
      "http://localhost:3000#{@object.code_url}"
    else
      "http://api.fitclubs.nsuask.ru#{@object.code_url}"
    end
  end
end
