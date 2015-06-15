class CreateTrainingsdays < ActiveRecord::Migration
  def change
    create_table :trainingsdays do |t|
      t.string :weekday
      t.references :workout_plan, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
