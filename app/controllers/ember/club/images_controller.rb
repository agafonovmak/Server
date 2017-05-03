class Ember::Club::ImagesController < Ember::BaseController
  before_action :authenticate_user!
end
