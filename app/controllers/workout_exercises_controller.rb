class WorkoutExercisesController < ApplicationController
  before_action :load_workout_exercise, only: [:show, :update, :destroy]

  def index
    @workout_exercises = WorkoutExercise.all
    render json: @workout_exercises
  end

  def show
    render json: @workout_exercise
  end

  def create
    @workout_exercise = WorkoutExercise.new(workout_exercise_params)
    if @workout_exercise.save
      render json: @workout_exercise, status: :created
    else
      render json: @workout_exercise.errors, status: :unprocessable_entity
    end
  end

  def update
    if @workout_exercise.update_attributes(workout_exercise_params)
      render json: @workout_exercise, status: :ok
    else
      render json: @workout_exercise.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @workout_exercise.destroy
      head :no_content
    else
      render json: @workout_exercise.errors, status: :unprocessable_entity
    end
  end

  protected

  def workout_exercise_params
    params.require(:workout_exercise).permit(:workout_id, :exercise_id, :sets, :reps, :weight, :feeling)
  end

  def load_workout_exercise
    @workout_exercise = WorkoutExercise.find params[:id]
  end
end
