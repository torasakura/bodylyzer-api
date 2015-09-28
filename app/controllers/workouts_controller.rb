class WorkoutsController < ApplicationController
  before_action :load_workout, only: [:show, :update, :destroy]

  def index
    @workouts = Workout.all
    render json: @workouts
  end

  def show
    render json: @workout
  end

  def create
    @workout = Workout.new(workout_params)
    if @workout.save
      render json: @workout, status: :created
    else
      render json: @workout.errors, status: :unprocessable_entity
    end
  end

  def update
    if @workout.update_attributes(workout_params)
      render json: @workout, status: :ok
    else
      render json: @workout.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @workout.destroy
      head :no_content
    else
      render json: @workout.errors, status: :unprocessable_entity
    end
  end

  protected

  def workout_params
    params.require(:workout).permit(:day, :trainingsday_id)
  end

  def load_workout
    @workout = Workout.find params[:id]
  end

end
