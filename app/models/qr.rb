require 'rqrcode'
require 'exceptions/qr/qr_cooldown_exception'
require 'exceptions/qr/qr_early_charge_exception'
require 'exceptions/qr/qr_late_charge_exception'
require 'exceptions/qr/qr_max_charges_exception'

class Qr
  include Mongoid::Document
  include Mongoid::Timestamps

  after_create :generate_qr

  field :name
  field :description
  field :charge_count,     type: Integer, default: 0
  field :user_max_charges, type: Integer, default: 10

  field :start_time, type: DateTime, default: DateTime.now
  field :end_time,   type: DateTime, default: DateTime.now

  field :last_charge, type: DateTime
  field :code_url
  belongs_to :template, class_name: 'Qr::Template'
  belongs_to :club

  def charge
    if DateTime.now < self.start_time
      raise QrEarlyChargeException
    end
    if DateTime.now > self.end_time
      raise QrLateChargeException
    end
    if self.charge_count == self.user_max_charges
      raise QrMaxChargesException
    end
    if self.last_charge.present? && (((DateTime.now - self.last_charge) * 24 * 60).to_i < self.template.cooldown)
      raise QrCooldownException
    end
    self.charge_count+=1
    self.last_charge = DateTime.now
    self.save!
    self.template.score
  end

  def generate_qr
    qrcode = RQRCode::QRCode.new("http://fitclubs.nsuask.ru/api/mobile/qrs/#{self.id}/charge")
    png = qrcode.as_png(
        resize_gte_to: false,
        resize_exactly_to: false,
        fill: 'white',
        color: 'black',
        size: 800,
        border_modules: 4,
        module_px_size: 6,
        file: nil
    )
    IO.binwrite("#{Rails.root}/public/system/#{self.id}.png", png.to_s)
    self.code_url = "/system/#{self.id}.png"
    self.save
  end

end
