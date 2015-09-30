require 'rails_helper'

RSpec.describe WorkoutExercisesController, type: :routing do
  it { expect(get:    "/workout_exercises").to   route_to("workout_exercises#index") }
  it { expect(get:    "/workout_exercises/1").to route_to("workout_exercises#show", id: "1") }
  it { expect(post:   "/workout_exercises").to   route_to("workout_exercises#create") }
  it { expect(put:    "/workout_exercises/1").to route_to("workout_exercises#update", id: "1") }
  it { expect(delete: "/workout_exercises/1").to route_to("workout_exercises#destroy", id: "1") }
end