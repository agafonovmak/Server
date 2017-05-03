class Ember::UserTypesController < Ember::BaseController
  before_action :authenticate_user!
end
