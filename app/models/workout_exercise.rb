class WorkoutExercise < ActiveRecord::Base
  belongs_to :workout
  belongs_to :exercise

  validates :workout_id, :exercise_id, :sets, :reps, :weight, :feeling, presence: true
  validates :sets, :reps, numericality: { only_integer: true, greater_than: 0 }
  validates :feeling, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 10 }
end
