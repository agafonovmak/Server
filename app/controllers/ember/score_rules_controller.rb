class Ember::ScoreRulesController < Ember::BaseController
  before_action :authenticate_user!

  def create
    build_item
    authorize(@item)
    @item.franchise_id = @current_user.franchise_id
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
