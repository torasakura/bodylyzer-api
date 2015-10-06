require 'rails_helper'

RSpec.describe Exercise, type: :model do

  describe "db structure" do
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:description).of_type(:text) }
    it { is_expected.to have_db_column(:video_url).of_type(:string) }
    it { is_expected.to have_db_column(:unit).of_type(:string) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }
  end

  describe "associations" do
    it { is_expected.to have_and_belong_to_many(:trainingsdays) }
    it { is_expected.to have_many(:workout_exercises) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:unit) }
  end

end

