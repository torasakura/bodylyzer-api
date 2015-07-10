require 'test_helper'

class WorkoutPlanTest < ActiveSupport::TestCase
  let(:plan_params) { { start_day: Date.today, end_day: Date.today + 2.weeks, name: "many push ups challenge", number_of_trainingsdays: 3, goal: "at most push ups", public: true } }
  let(:challenge) { WorkoutPlan.new plan_params }

  it "is valid with valid params" do
    challenge.must_be :valid?
  end

  it "is invalid without start_day" do
    plan_params.delete :start_day
    challenge.wont_be :valid?
    challenge.errors[:start_day].must_be :present?
  end

  it "is invalid without end_day" do
    plan_params.delete :end_day
    challenge.wont_be :valid?
    challenge.errors[:end_day].must_be :present?
  end

  it "is invalid without name" do
    plan_params.delete :name
    challenge.wont_be :valid?
    challenge.errors[:name].must_be :present?
  end

  it "is invalid without number_of_trainingsdays" do
    plan_params.delete :number_of_trainingsdays
    challenge.wont_be :valid?
    challenge.errors[:number_of_trainingsdays].must_be :present?
  end

  it "is invalid without goal" do
    plan_params.delete :goal
    challenge.wont_be :valid?
    challenge.errors[:goal].must_be :present?
  end

  it "is invalid without public" do
    plan_params.delete :public
    challenge.wont_be :valid?
    challenge.errors[:public].must_be :present?
  end

  it "is invalid if end_day is before start_day" do
    challenge.end_day = Date.today - 2.days
    challenge.wont_be :valid?
    challenge.errors[:end_day].must_be :present?
  end

  it "is invalid if trainingsdays is not between 1 and 7" do
    challenge.number_of_trainingsdays = 0
    challenge.wont_be :valid?
    challenge.errors[:number_of_trainingsdays].must_be :present?
    challenge.number_of_trainingsdays = 8
    challenge.wont_be :valid?
    challenge.errors[:number_of_trainingsdays].must_be :present?
  end

end
