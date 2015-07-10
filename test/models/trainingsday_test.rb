require 'test_helper'

class TrainingsdayTest < ActiveSupport::TestCase
  let(:trainingsday_params) { { weekday: 'Monday', workout_plan_id: 1 } }
  let(:monday_training) { Trainingsday.new trainingsday_params }

  it "is valid with valid params" do
    monday_training.must_be :valid?
  end

  it "is invalid without weekday" do
    trainingsday_params.delete :weekday
    monday_training.wont_be :valid?
    monday_training.errors[:weekday].must_be :present?
  end

  # TODO: better test if association exists
  it "is invalid without workout_plan_id" do
    trainingsday_params.delete :workout_plan_id
    monday_training.wont_be :valid?
    monday_training.errors[:workout_plan_id].must_be :present?
  end
end

