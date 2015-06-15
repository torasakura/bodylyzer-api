class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :name
      t.text :description
      t.string :video_url
      t.string :unit

      t.timestamps null: false
    end
  end
end
