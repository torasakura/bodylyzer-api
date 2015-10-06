require 'rails_helper'

RSpec.describe Workout, type: :model do

  describe "db structure" do
    it { is_expected.to have_db_column(:day).of_type(:date) }
    it { is_expected.to have_db_column(:trainingsday_id).of_type(:integer) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:day) }
    it { is_expected.to validate_presence_of(:trainingsday_id) }
  end

end