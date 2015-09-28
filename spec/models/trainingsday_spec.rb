require 'rails_helper'

RSpec.describe Trainingsday, type: :model do

  describe "db structure" do
    it { is_expected.to have_db_column(:weekday).of_type(:string) }
    it { is_expected.to have_db_column(:workout_plan_id).of_type(:integer) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:weekday) }
    # TODO: better test if association exists
    it { is_expected.to validate_presence_of(:workout_plan_id) }
  end

end

