require 'test_helper'

class ExerciseTest < ActiveSupport::TestCase
  let(:exercise_params) { { name: 'push up', description: 'short sescription of exercise', unit: 'bodyweight' } }
  let(:push_up) { Exercise.new exercise_params }

  it "is valid with valid params" do
    push_up.must_be :valid?
  end

  it "is invalid without name" do
    exercise_params.delete :name
    push_up.wont_be :valid?
    push_up.errors[:name].must_be :present?
  end

  it "is invalid without description" do
    exercise_params.delete :description
    push_up.wont_be :valid?
    push_up.errors[:description].must_be :present?
  end

  it "is invalid without unit" do
    exercise_params.delete :unit
    push_up.wont_be :valid?
    push_up.errors[:unit].must_be :present?
  end


end

