class Ember::Workout::ImagesController < Ember::BaseController
  before_action :authenticate_user!
end
