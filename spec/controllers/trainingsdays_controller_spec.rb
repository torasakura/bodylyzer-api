require 'rails_helper'

RSpec.describe TrainingsdaysController, type: :controller do

  it_behaves_like "api_controller"

  let!(:workout_plan) {WorkoutPlan.create(start_day: Date.today, end_day: Date.today + 1.week, name: "new plan", number_of_trainingsdays: 2, goal: "max volume", public: true)}

  let(:valid_attributes) {
    { weekday: "Tuesday", workout_plan_id: workout_plan.id }
  }

  let(:invalid_attributes) {
    { weekday: nil, workout_plan_id: 1 }
  }

  let!(:trainingsday) { Trainingsday.create(valid_attributes) }

  describe "GET #index" do
    it "assigns all trainingsdays as @trainingsdays" do
      get :index, { format: :json }
      expect(assigns(:trainingsdays)).to eq([trainingsday])
    end
  end

  describe "GET #show" do
    it "assigns the requested trainingsday as @trainingsday" do
      get :show, { id: trainingsday.id, format: :json }
      expect(assigns(:trainingsday)).to eq(trainingsday)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Trainingsday" do
        expect {
          post :create, { trainingsday: valid_attributes, format: :json  }
        }.to change(Trainingsday, :count).by(1)
      end

      it "assigns a newly created trainingsday as @trainingsday" do
        post :create, { trainingsday: valid_attributes, format: :json  }
        expect(assigns(:trainingsday)).to be_a(Trainingsday)
        expect(assigns(:trainingsday)).to be_persisted
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved trainingsday as @trainingsday" do
        post :create, { trainingsday: invalid_attributes, format: :json  }
        expect(assigns(:trainingsday)).to be_a_new(Trainingsday)
      end

      it "returns unprocessable_entity status" do
        post :create, { trainingsday: invalid_attributes }
        expect(response.status).to eq(422)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { weekday: "Monday"}
      }

      it "updates the requested trainingsday" do
        put :update, { id: trainingsday.id, trainingsday: new_attributes, format: :json  }
        trainingsday.reload
        expect(trainingsday.weekday).to eq("Monday")
      end

      it "assigns the requested trainingsday as @trainingsday" do
        put :update, { id: trainingsday.id, trainingsday: valid_attributes, format: :json  }
        expect(assigns(:trainingsday)).to eq(trainingsday)
      end
    end

    context "with invalid params" do
      it "assigns the trainingsday as @trainingsday" do
        put :update, { id: trainingsday.id, trainingsday: invalid_attributes, format: :json  }
        expect(assigns(:trainingsday)).to eq(trainingsday)
      end

      it "returns unprocessable_entity status" do
        put :update, { id: trainingsday.id, trainingsday: invalid_attributes, format: :json }
        expect(response.status).to eq(422)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested trainingsday" do
      expect {
        delete :destroy, { id: trainingsday.id, format: :json  }
      }.to change(Trainingsday, :count).by(-1)
    end

    it "redirects to the trainingsdays list" do
      delete :destroy, { id: trainingsday.id, format: :json  }
      expect(response.status).to eq(204)
    end
  end

end
