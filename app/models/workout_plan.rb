class WorkoutPlan < ActiveRecord::Base
  has_many :trainingsdays
end
