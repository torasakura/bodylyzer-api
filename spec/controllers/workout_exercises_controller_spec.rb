require 'rails_helper'

RSpec.describe WorkoutExercisesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # WorkoutExercise. As you add validations to WorkoutExercise, be sure to
  # adjust the attributes here as well.

  it_behaves_like "api_controller"

  let!(:exercise) { Exercise.create(name: "PushUp", description: "do a full push up", unit: "Bodyweight") }
  let!(:workout_plan) {WorkoutPlan.create(start_day: Date.today, end_day: Date.today + 1.week, name: "new plan", number_of_trainingsdays: 2, goal: "max volume", public: true)}
  let!(:trainingsday) { Trainingsday.create(weekday: "Tuesday", workout_plan_id: workout_plan.id) }
  let!(:workout) { Workout.create(day: Date.today, trainingsday_id: trainingsday.id) }

  let(:valid_attributes) {
    { workout_id: workout.id, exercise_id: exercise.id, sets: 3, reps: 20, weight: 0.0, feeling: 3 }
  }

  let(:invalid_attributes) {
    { workout_id: workout.id, exercise_id: exercise.id, sets: nil, reps: nil, weight: 0.0, feeling: 3 }
  }

  let!(:workout_exercise) { WorkoutExercise.create(valid_attributes) }

  describe "GET #index" do
    it "assigns all workout_exercises as @workout_exercises" do
      get :index, { format: :json }
      expect(assigns(:workout_exercises)).to eq([workout_exercise])
    end
  end

  describe "GET #show" do
    it "assigns the requested workout_exercise as @workout_exercise" do
      get :show, { id: workout_exercise.id, format: :json }
      expect(assigns(:workout_exercise)).to eq(workout_exercise)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new WorkoutExercise" do
        expect {
          post :create, { workout_exercise: valid_attributes, format: :json  }
        }.to change(WorkoutExercise, :count).by(1)
      end

      it "assigns a newly created workout_exercise as @workout_exercise" do
        post :create, { workout_exercise: valid_attributes, format: :json  }
        expect(assigns(:workout_exercise)).to be_a(WorkoutExercise)
        expect(assigns(:workout_exercise)).to be_persisted
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved workout_exercise as @workout_exercise" do
        post :create, { workout_exercise: invalid_attributes, format: :json  }
        expect(assigns(:workout_exercise)).to be_a_new(WorkoutExercise)
      end

      it "returns unprocessable_entity status" do
        post :create, { workout_exercise: invalid_attributes }
        expect(response.status).to eq(422)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { sets: 5, feeling: 5 }
      }

      it "updates the requested workout_exercise" do
        put :update, { id: workout_exercise.id, workout_exercise: new_attributes, format: :json  }
        workout_exercise.reload
        expect(workout_exercise.sets).to eq(5)
        expect(workout_exercise.feeling).to eq(5)
      end

      it "assigns the requested workout_exercise as @workout_exercise" do
        put :update, { id: workout_exercise.id, workout_exercise: valid_attributes, format: :json  }
        expect(assigns(:workout_exercise)).to eq(workout_exercise)
      end
    end

    context "with invalid params" do
      it "assigns the workout_exercise as @workout_exercise" do
        put :update, { id: workout_exercise.id, workout_exercise: invalid_attributes, format: :json  }
        expect(assigns(:workout_exercise)).to eq(workout_exercise)
      end

      it "returns unprocessable_entity status" do
        put :update, { id: workout_exercise.id, workout_exercise: invalid_attributes, format: :json }
        expect(response.status).to eq(422)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested workout_exercise" do
      expect {
        delete :destroy, { id: workout_exercise.id, format: :json  }
      }.to change(WorkoutExercise, :count).by(-1)
    end

    it "redirects to the workout_exercises list" do
      delete :destroy, { id: workout_exercise.id, format: :json  }
      expect(response.status).to eq(204)
    end
  end

end
