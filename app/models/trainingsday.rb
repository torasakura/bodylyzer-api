class Trainingsday < ActiveRecord::Base
  belongs_to :workout_plan
  has_and_belongs_to_many :exercises

  validates :weekday, :workout_plan_id, presence: true
end
