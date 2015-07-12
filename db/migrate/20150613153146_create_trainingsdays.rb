class CreateTrainingsdays < ActiveRecord::Migration
  def change
    create_table :trainingsdays do |t|
      t.string :weekday
      t.references :workout_plan, index: true, foreign_key: true

      t.timestamps null: false
    end

    create_table :exercises_trainingsdays, id: false do |t|
      t.references :exercise, index: true
      t.references :trainingsday, index: true
      t.timestamps null: false
    end
  end
end
