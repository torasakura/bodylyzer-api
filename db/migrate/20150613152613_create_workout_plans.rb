class CreateWorkoutPlans < ActiveRecord::Migration
  def change
    create_table :workout_plans do |t|
      t.date :start_day
      t.date :end_day
      t.string :name
      t.integer :trainingsdays
      t.boolean :public

      t.timestamps null: false
    end
  end
end
