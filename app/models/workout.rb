class Workout < ActiveRecord::Base
  belongs_to :trainingsday
  has_many :workout_exercises

  validates :day, :trainingsday_id, presence: true
end
