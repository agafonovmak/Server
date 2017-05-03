class Ember::Card::TemplatesController < Ember::BaseController
  before_action :authenticate_user!
end
