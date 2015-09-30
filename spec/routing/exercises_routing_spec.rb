require 'rails_helper'

RSpec.describe ExercisesController, type: :routing do
  it { expect(get:    "/exercises").to   route_to("exercises#index") }
  it { expect(get:    "/exercises/1").to route_to("exercises#show", id: "1") }
  it { expect(post:   "/exercises").to   route_to("exercises#create") }
  it { expect(put:    "/exercises/1").to route_to("exercises#update", id: "1") }
  it { expect(delete: "/exercises/1").to route_to("exercises#destroy", id: "1") }
end