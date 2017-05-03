class Mobile::CardsController < Mobile::BaseController
    before_action :set_card, only: :break_frost
    before_action :authenticate_user!

    swagger_controller :cards, 'Cards Management'

    swagger_api :index do
      summary 'Lists all cards'
      param :header, 'Authorization', :string, :required, 'Authentication token'
      response :ok
    end

    swagger_api :show do
      summary 'Show card by id'
      param :header, 'Authorization', :string, :required, 'Authentication token'
      param :path, :id, :string, :required, 'card id'
      response :ok
    end

    swagger_api :break_frost do
      summary 'Break frost card by id'
      param :header, 'Authorization', :string, :required, 'Authentication token'
      param :path, :id, :string, :required, 'card id'
      response :ok
    end

    swagger_api :add_social_score do
      summary 'Add score to users loyalty via score rule id'
      param :header, 'Authorization', :string, :required, 'Authentication token'
      param :query, :name, :string, :required, 'Score rule name'
      response 200
      response 404
      response 500
    end

    def break_frost
      @card.break_frost!
      @days = (@card.expiration_date - DateTime.now).to_i
      @card.expiration_date -= @days
      @card.available_free_freezing_days_count += @days
      @card.save
      head 200
    end

    def add_social_score
      @social_rule = @current_user.franchise.score_rules.find_by name: params[:name]
      @current_user.loyalty.score = @current_user.loyalty.score + @social_rule.score
      if @current_user.loyalty.save!
        head 200
      else
        head 500
      end
    end

    private
      def set_card
        @card = Card.find params[:id]
      end
end
