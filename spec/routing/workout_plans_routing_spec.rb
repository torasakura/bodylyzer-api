require 'rails_helper'

RSpec.describe WorkoutPlansController, type: :routing do
  it { expect(get:    "/workout_plans").to   route_to("workout_plans#index") }
  it { expect(get:    "/workout_plans/1").to route_to("workout_plans#show", id: "1") }
  it { expect(post:   "/workout_plans").to   route_to("workout_plans#create") }
  it { expect(put:    "/workout_plans/1").to route_to("workout_plans#update", id: "1") }
  it { expect(delete: "/workout_plans/1").to route_to("workout_plans#destroy", id: "1") }
end