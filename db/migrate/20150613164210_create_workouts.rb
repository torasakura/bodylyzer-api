class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.date :day
      t.references :trainingsday, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
