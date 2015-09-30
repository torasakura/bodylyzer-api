require 'rails_helper'

RSpec.describe WorkoutsController, type: :routing do
  it { expect(get:    "/workouts").to   route_to("workouts#index") }
  it { expect(get:    "/workouts/1").to route_to("workouts#show", id: "1") }
  it { expect(post:   "/workouts").to   route_to("workouts#create") }
  it { expect(put:    "/workouts/1").to route_to("workouts#update", id: "1") }
  it { expect(delete: "/workouts/1").to route_to("workouts#destroy", id: "1") }
end