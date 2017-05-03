class Mobile::RewardsController < Mobile::BaseController
  before_action :set_reward_template, only: :reserve
  before_action :authenticate_user!

  swagger_controller :qrs, 'Rewards Management'

  swagger_api :reserve do
    summary 'Reserve Reward by id'
    param :header, 'Authorization', :string, :required, 'Authentication token'
    param :path, :id, :string, :required, 'Reward template id'
    response :ok
    response :not_found
    response 600, 'There are not rewards with this template'
    response 601, 'Not enough level exception'
  end

  def reserve
    if @reward_template.available_rewards_count == 0
      head 600
    else
      if @reward_template.level_cost > @current_user.loyalty.level
        head 601
      else
        @reward = Reward.where(template: @reward_template).active.first
        @reward.user = @current_user
        @reward.set_as_waiting!
        History::Reward.create datetime: DateTime.now,
                               franchise: @reward_template.club.franchise,
                               club: @reward_template.club,
                               reward_template: @reward_template,
                               client: @current_user,
                               type: :waiting
        respond_with @reward, status: :ok, location: false
      end
    end
  end

  private
    def set_reward_template
      @reward_template = ::Reward::Template.find params[:id]
    end
end
