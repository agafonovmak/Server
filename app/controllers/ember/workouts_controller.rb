class Ember::WorkoutsController < Ember::BaseController
  before_action :authenticate_user!
end
