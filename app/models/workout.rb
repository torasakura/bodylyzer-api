class Workout < ActiveRecord::Base
  belongs_to :trainingsday
  has_many :workout_exercises, dependent: :destroy

  validates :day, :trainingsday_id, presence: true
end
