class WorkoutPlan < ActiveRecord::Base
  has_many :trainingsdays

  validates :start_day, :end_day, :name, :number_of_trainingsdays, :goal, :public, presence: true
  validates :number_of_trainingsdays, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 7 }
  validate :end_day_after_start_day

  def end_day_after_start_day
    if (end_day.present? && start_day.present? ) && end_day < start_day
      errors.add(:end_day, "cannot be before start day") 
    end
  end
end

