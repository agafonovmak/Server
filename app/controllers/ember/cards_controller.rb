class Ember::CardsController < Ember::BaseController
  before_action :authenticate_user!
end
