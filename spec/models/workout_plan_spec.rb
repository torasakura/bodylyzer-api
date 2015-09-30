require 'rails_helper'

RSpec.describe WorkoutPlan, type: :model do

  let(:plan_params) { { start_day: Date.today, end_day: Date.today + 2.weeks, name: "many push ups challenge", number_of_trainingsdays: 3, goal: "at most push ups", public: true } }
  let(:challenge) { WorkoutPlan.new plan_params }

  describe "db structure" do
    it { is_expected.to have_db_column(:start_day).of_type(:date) }
    it { is_expected.to have_db_column(:end_day).of_type(:date) }
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:goal).of_type(:string) }
    it { is_expected.to have_db_column(:public).of_type(:boolean) }
    it { is_expected.to have_db_column(:number_of_trainingsdays).of_type(:integer) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:start_day) }
    it { is_expected.to validate_presence_of(:end_day) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:goal) }
    it { is_expected.to validate_presence_of(:public) }
    it { is_expected.to validate_presence_of(:number_of_trainingsdays) }
    it { is_expected.to validate_numericality_of(:number_of_trainingsdays).only_integer.is_greater_than(0).is_less_than_or_equal_to(7)  }
    it "is invalid if end_day is before start_day" do
      challenge.end_day = Date.today - 2.days
      expect(challenge).not_to be_valid
      # expect(challenge).to raise_error(ActiveRecord::RecordInvalid, "cannot be before start day")
      # challenge.errors[:end_day].must_be :present?
    end
  end

end
