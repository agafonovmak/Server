class Ember::FranchisesController < Ember::BaseController
  before_action :authenticate_user!
end
