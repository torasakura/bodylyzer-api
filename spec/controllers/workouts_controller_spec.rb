require 'rails_helper'

RSpec.describe WorkoutsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Workout. As you add validations to Workout, be sure to
  # adjust the attributes here as well.

  it_behaves_like "api_controller"

  let!(:workout_plan) {WorkoutPlan.create(start_day: Date.today, end_day: Date.today + 1.week, name: "new plan", number_of_trainingsdays: 2, goal: "max volume", public: true)}
  let!(:trainingsday) { Trainingsday.create(weekday: "Tuesday", workout_plan_id: workout_plan.id) }

  let(:valid_attributes) {
    { day: Date.today, trainingsday_id: trainingsday.id }
  }

  let(:invalid_attributes) {
    { day: nil, trainingsday_id: trainingsday.id }
  }

  let!(:workout) { Workout.create(valid_attributes) }

  describe "GET #index" do
    it "assigns all workouts as @workouts" do
      get :index, { format: :json }
      expect(assigns(:workouts)).to eq([workout])
    end
  end

  describe "GET #show" do
    it "assigns the requested workout as @workout" do
      get :show, { id: workout.id, format: :json }
      expect(assigns(:workout)).to eq(workout)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Workout" do
        expect {
          post :create, { workout: valid_attributes, format: :json  }
        }.to change(Workout, :count).by(1)
      end

      it "assigns a newly created workout as @workout" do
        post :create, { workout: valid_attributes, format: :json  }
        expect(assigns(:workout)).to be_a(Workout)
        expect(assigns(:workout)).to be_persisted
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved workout as @workout" do
        post :create, { workout: invalid_attributes, format: :json  }
        expect(assigns(:workout)).to be_a_new(Workout)
      end

      it "returns unprocessable_entity status" do
        post :create, { workout: invalid_attributes }
        expect(response.status).to eq(422)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { day: Date.tomorrow }
      }

      it "updates the requested workout" do
        put :update, { id: workout.id, workout: new_attributes, format: :json  }
        workout.reload
        expect(workout.day).to eq(Date.tomorrow)
      end

      it "assigns the requested workout as @workout" do
        put :update, { id: workout.id, workout: valid_attributes, format: :json  }
        expect(assigns(:workout)).to eq(workout)
      end
    end

    context "with invalid params" do
      it "assigns the workout as @workout" do
        put :update, { id: workout.id, workout: invalid_attributes, format: :json  }
        expect(assigns(:workout)).to eq(workout)
      end

      it "returns unprocessable_entity status" do
        put :update, { id: workout.id, workout: invalid_attributes, format: :json }
        expect(response.status).to eq(422)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested workout" do
      expect {
        delete :destroy, { id: workout.id, format: :json  }
      }.to change(Workout, :count).by(-1)
    end

    it "redirects to the workouts list" do
      delete :destroy, { id: workout.id, format: :json  }
      expect(response.status).to eq(204)
    end
  end

end
