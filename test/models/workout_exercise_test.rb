require 'test_helper'

class WorkoutExerciseTest < ActiveSupport::TestCase
  let(:w_exercise_params) { { workout_id: 1, exercise_id: 1, sets: 3, reps: 10, weight: 0, feeling: 10 } }
  let(:push_ups) { WorkoutExercise.new w_exercise_params }

  it "is valid with valid params" do
    push_ups.must_be :valid?
  end

  # TODO: better test if association is available
  it "is invalid without workout_id" do
    w_exercise_params.delete :workout_id
    push_ups.wont_be :valid?
    push_ups.errors[:workout_id].must_be :present?
  end

  # TODO: better test if association is available
  it "is invalid without exercise_id" do
    w_exercise_params.delete :exercise_id
    push_ups.wont_be :valid?
    push_ups.errors[:exercise_id].must_be :present?
  end

  it "is invalid without sets" do
    w_exercise_params.delete :sets
    push_ups.wont_be :valid?
    push_ups.errors[:sets].must_be :present?
  end

  it "is invalid without reps" do
    w_exercise_params.delete :reps
    push_ups.wont_be :valid?
    push_ups.errors[:reps].must_be :present?
  end

  it "is invalid without weight" do
    w_exercise_params.delete :weight
    push_ups.wont_be :valid?
    push_ups.errors[:weight].must_be :present?
  end

  it "is invalid without feeling" do
    w_exercise_params.delete :feeling
    push_ups.wont_be :valid?
    push_ups.errors[:feeling].must_be :present?
  end

  it "is invalid if sets = 0" do 
    push_ups.sets = 0
    push_ups.wont_be :valid?
    push_ups.errors[:sets].must_be :present?
  end

  it "is invalid if reps = 0" do 
    push_ups.reps = 0
    push_ups.wont_be :valid?
    push_ups.errors[:reps].must_be :present?
  end

  it "is invalid if feeling is not between 1 and 10" do
    push_ups.feeling = 0
    push_ups.wont_be :valid?
    push_ups.errors[:feeling].must_be :present?
    push_ups.feeling = 11
    push_ups.wont_be :valid?
    push_ups.errors[:feeling].must_be :present?
  end
  
end
