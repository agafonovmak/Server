class Ember::RolesController < Ember::BaseController
  before_action :authenticate_user!
end
