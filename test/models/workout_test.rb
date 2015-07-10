require 'test_helper'

class WorkoutTest < ActiveSupport::TestCase
  let(:workout_params) { { day: Date.today, trainingsday_id: 1 } }
  let(:workout) { Workout.new workout_params }

  it "is valid with valid params" do
    workout.must_be :valid?
  end

  it "is invalid without a day" do
    workout_params.delete :day
    workout.wont_be :valid?
    workout.errors[:day].must_be :present?
  end

  # TODO: better test if association is available
  it "is invalid without a trainingsday_id" do
    workout_params.delete :trainingsday_id
    workout.wont_be :valid?
    workout.errors[:trainingsday_id].must_be :present?
  end

end
