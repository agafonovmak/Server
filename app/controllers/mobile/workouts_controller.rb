class Mobile::WorkoutsController < Mobile::BaseController

  before_action :authenticate_user!, only: :add_me

  swagger_controller :workouts, 'Workouts Management'

  swagger_api :index do
    summary 'Lists all workouts'
    response :ok
  end

  swagger_api :show do
    summary 'Show workout by id'
    param :path, :id, :string, :required, 'workout id'
    response :ok
  end

  swagger_api :add_me do
    summary 'Add user to workout by id'
    param :header, 'Authorization', :string, :required, 'Authentication token'
    param :path, :id, :string, :required, 'workout id'
    response 201
    response 601, 'User already in'
    response 500
  end

  swagger_api :remove_me do
    summary 'Remove user from workout by id'
    param :header, 'Authorization', :string, :required, 'Authentication token'
    param :path, :id, :string, :required, 'workout id'
    response 201
    response 601, 'User already not in workout'
    response 500
  end

  def add_me
    @workout = Workout.find params[:id]
    if @workout.users.include? (@current_user)
      head 601
    else
      @workout.users << @current_user
      if @workout.save!
        respond_with @workout, serializer: Mobile::WorkoutSerializer, location: false
      else
        head 500
      end
    end
  end

  def remove_me
    @workout = Workout.find params[:id]
    if @workout.users.include? (@current_user)
      @workout.users.delete(@current_user)
      if @workout.save!
        respond_with @workout, serializer: Mobile::WorkoutSerializer, location: false
      else
        head 500
      end
    else
      head 601
    end
  end

end
