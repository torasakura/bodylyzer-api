require 'rails_helper'

RSpec.describe WorkoutPlansController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # WorkoutPlan. As you add validations to WorkoutPlan, be sure to
  # adjust the attributes here as well.

  before do
    user = User.create(email: "user@example.com", password: "password")
    authentication_token = AuthenticationToken.create(user_id: user.id,
      body: "token", last_used_at: DateTime.current)
    request.env["HTTP_X_USER_EMAIL"] = user.email
    request.env["HTTP_X_AUTH_TOKEN"] = authentication_token.body
  end

  it_behaves_like "api_controller"
  it_behaves_like "authenticated_api_controller"

  let(:valid_attributes) {
    { start_day: Date.today, end_day: Date.today + 1.week, name: "new plan", number_of_trainingsdays: 2, goal: "max volume", public: true }
  }

  let(:invalid_attributes) {
    { start_day: nil, end_day: nil, name: "new plan", number_of_trainingsdays: 2, goal: "max volume", public: true }
  }

  let!(:workout_plan) { WorkoutPlan.create(valid_attributes) }

  describe "GET #index" do
    it "assigns all workout_plans as @workout_plans" do
      get :index, { format: :json }
      expect(assigns(:workout_plans)).to eq([workout_plan])
    end
  end

  describe "GET #show" do
    it "assigns the requested workout_plan as @workout_plan" do
      get :show, { id: workout_plan.id, format: :json }
      expect(assigns(:workout_plan)).to eq(workout_plan)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new WorkoutPlan" do
        expect {
          post :create, { workout_plan: valid_attributes, format: :json  }
        }.to change(WorkoutPlan, :count).by(1)
      end

      it "assigns a newly created workout_plan as @workout_plan" do
        post :create, { workout_plan: valid_attributes, format: :json  }
        expect(assigns(:workout_plan)).to be_a(WorkoutPlan)
        expect(assigns(:workout_plan)).to be_persisted
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved workout_plan as @workout_plan" do
        post :create, { workout_plan: invalid_attributes, format: :json  }
        expect(assigns(:workout_plan)).to be_a_new(WorkoutPlan)
      end

      it "returns unprocessable_entity status" do
        post :create, { workout_plan: invalid_attributes }
        expect(response.status).to eq(422)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { name: "Max Power", number_of_trainingsdays: 4 }
      }

      it "updates the requested workout_plan" do
        put :update, { id: workout_plan.id, workout_plan: new_attributes, format: :json  }
        workout_plan.reload
        expect(workout_plan.name).to eq("Max Power")
        expect(workout_plan.number_of_trainingsdays).to eq(4)
      end

      it "assigns the requested workout_plan as @workout_plan" do
        put :update, { id: workout_plan.id, workout_plan: valid_attributes, format: :json  }
        expect(assigns(:workout_plan)).to eq(workout_plan)
      end
    end

    context "with invalid params" do
      it "assigns the workout_plan as @workout_plan" do
        put :update, { id: workout_plan.id, workout_plan: invalid_attributes, format: :json  }
        expect(assigns(:workout_plan)).to eq(workout_plan)
      end

      it "returns unprocessable_entity status" do
        put :update, { id: workout_plan.id, workout_plan: invalid_attributes, format: :json }
        expect(response.status).to eq(422)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested workout_plan" do
      expect {
        delete :destroy, { id: workout_plan.id, format: :json  }
      }.to change(WorkoutPlan, :count).by(-1)
    end

    it "redirects to the workout_plans list" do
      delete :destroy, { id: workout_plan.id, format: :json  }
      expect(response.status).to eq(204)
    end
  end

end
