require 'rails_helper'

RSpec.describe WorkoutExercise, type: :model do

  describe "db structure" do
    it { is_expected.to have_db_column(:workout_id).of_type(:integer) }
    it { is_expected.to have_db_column(:exercise_id).of_type(:integer) }
    it { is_expected.to have_db_column(:sets).of_type(:integer) }
    it { is_expected.to have_db_column(:reps).of_type(:integer) }
    it { is_expected.to have_db_column(:weight).of_type(:decimal) }
    it { is_expected.to have_db_column(:feeling).of_type(:integer) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }
  end

  describe "associations" do
    it { is_expected.to belong_to(:workout) }
    it { is_expected.to belong_to(:exercise) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:workout_id) }
    it { is_expected.to validate_presence_of(:exercise_id) }
    it { is_expected.to validate_presence_of(:sets) }
    it { is_expected.to validate_presence_of(:reps) }
    it { is_expected.to validate_presence_of(:weight) }
    it { is_expected.to validate_presence_of(:feeling) }
    it { is_expected.to validate_numericality_of(:sets).only_integer.is_greater_than(0) }
    it { is_expected.to validate_numericality_of(:reps).only_integer.is_greater_than(0) }
    it { is_expected.to validate_numericality_of(:feeling).only_integer.is_greater_than(0).is_less_than_or_equal_to(10) }
  end

end