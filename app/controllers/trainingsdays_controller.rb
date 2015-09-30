class TrainingsdaysController < ApplicationController
  before_action :load_trainingsday, only: [:show, :update, :destroy]

  def index
    @trainingsdays = Trainingsday.all
    render json: @trainingsdays
  end

  def show
    render json: @trainingsday
  end

  def create
    @trainingsday = Trainingsday.new(trainingsday_params)
    if @trainingsday.save
      render json: @trainingsday, status: :created
    else
      render json: @trainingsday.errors, status: :unprocessable_entity
    end
  end

  def update
    if @trainingsday.update_attributes(trainingsday_params)
      render json: @trainingsday, status: :ok
    else
      render json: @trainingsday.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @trainingsday.destroy
      head :no_content
    else
      render json: @trainingsday.errors, status: :unprocessable_entity
    end
  end

  protected

  def trainingsday_params
    params.require(:trainingsday).permit(:weekday, :workout_plan_id)
  end

  def load_trainingsday
    @trainingsday = Trainingsday.find params[:id]
  end
end
