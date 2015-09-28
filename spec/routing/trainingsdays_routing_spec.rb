require 'rails_helper'

RSpec.describe TrainingsdaysController, type: :routing do
  it { expect(get:    "/trainingsdays").to   route_to("trainingsdays#index") }
  it { expect(get:    "/trainingsdays/1").to route_to("trainingsdays#show", id: "1") }
  it { expect(post:   "/trainingsdays").to   route_to("trainingsdays#create") }
  it { expect(put:    "/trainingsdays/1").to route_to("trainingsdays#update", id: "1") }
  it { expect(delete: "/trainingsdays/1").to route_to("trainingsdays#destroy", id: "1") }
end