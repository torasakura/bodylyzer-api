class ExercisesController < ApplicationController

  before_action :load_exercise, only: [:show, :update, :destroy]

  def index
    @exercises = Exercise.all
    render json: @exercises
  end

  def show
    render json: @exercise 
  end

  def create
    @exercise = Exercise.new(exercise_params)
    if @exercise.save
      render json: @exercise, status: :created
    else
      render json: @exercise.errors, status: :unprocessable_entity
    end
  end

  def update    
    if @exercise.update_attributes(exercise_params)
      render json: @exercise, status: :ok
    else
      render json: @exercise.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @exercise.destroy
      head :no_content
    else
      render json: @exercise.errors, status: :unprocessable_entity
    end
  end

  protected

  def load_exercise
    @exercise = Exercise.find params[:id] 
  end

  def exercise_params
    params.require(:exercise).permit(:name, :description, :video_url, :unit)
  end

end
