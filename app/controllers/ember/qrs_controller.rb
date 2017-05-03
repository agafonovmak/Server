require 'exceptions/qr/qr_cooldown_exception'
require 'exceptions/qr/qr_early_charge_exception'
require 'exceptions/qr/qr_late_charge_exception'
require 'exceptions/qr/qr_max_charges_exception'

class Ember::QrsController < Ember::BaseController
  before_action :authenticate_user!

  def create
    build_item
    authorize(@item)
    @item.club = @current_user.clubs.first
    @item.template_id = params[:qr][:qr_template_id]
    form = get_form
    if form.present?
      if form.validate(permitted_params)
        form.save
      else
        return respond_with(form)
      end
    else
      @item.save
    end
    yield(@item) if block_given?
    respond_with(@item, serializer: serializer, location: false, root: root_name)
  end

end
