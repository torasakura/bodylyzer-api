class WorkoutPlansController < ApplicationController
  before_action :load_workout_plan, only: [:show, :update, :destroy]

  def index
    @workout_plans = WorkoutPlan.all
    render json: @workout_plans
  end

  def show
    render json: @workout_plan
  end

  def create
    @workout_plan = WorkoutPlan.new(workout_plan_params)
    if @workout_plan.save
      render json: @workout_plan, status: :created
    else
      render json: @workout_plan.errors, status: :unprocessable_entity
    end
  end

  def update
    if @workout_plan.update_attributes(workout_plan_params)
      render json: @workout_plan, status: :ok
    else
      render json: @workout_plan.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @workout_plan.destroy
      head :no_content
    else
      render json: @workout_plan.errors, status: :unprocessable_entity
    end
  end

  protected

  def workout_plan_params
    params.require(:workout_plan).permit(:start_day, :end_day, :name, :number_of_trainingsdays, :goal, :public)
  end

  def load_workout_plan
    @workout_plan = WorkoutPlan.find params[:id]
  end
end
