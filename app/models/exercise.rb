class Exercise < ActiveRecord::Base
  has_and_belongs_to_many :trainingsdays
  has_many :workout_exercises

  validates :name, :description, :unit, presence: true
end
