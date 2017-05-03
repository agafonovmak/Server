class Ember::Coach::AchievementsController < Ember::BaseController
  before_action :authenticate_user!
end
