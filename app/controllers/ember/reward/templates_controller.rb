class Ember::Reward::TemplatesController < Ember::BaseController
  before_action :authenticate_user!
end
