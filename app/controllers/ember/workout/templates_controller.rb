class Ember::Workout::TemplatesController < Ember::BaseController
  before_action :authenticate_user!
end
