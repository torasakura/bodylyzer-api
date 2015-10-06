require 'rails_helper'

RSpec.describe ExercisesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Exercise. As you add validations to Exercise, be sure to
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
    { name: "PushUp", description: "do a full push up", unit: "Bodyweight" }
  }

  let(:invalid_attributes) {
    { name: nil, description: "do a full push up", unit: "Bodyweight" }
  }

  let!(:exercise) { Exercise.create(valid_attributes) }

  describe "GET #index" do
    it "assigns all exercises as @exercises" do
      get :index, { format: :json }
      expect(assigns(:exercises)).to eq([exercise])
    end
  end

  describe "GET #show" do
    it "assigns the requested exercise as @exercise" do
      get :show, { id: exercise.id, format: :json }
      expect(assigns(:exercise)).to eq(exercise)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Exercise" do
        expect {
          post :create, { exercise: valid_attributes, format: :json  }
        }.to change(Exercise, :count).by(1)
      end

      it "assigns a newly created exercise as @exercise" do
        post :create, { exercise: valid_attributes, format: :json  }
        expect(assigns(:exercise)).to be_a(Exercise)
        expect(assigns(:exercise)).to be_persisted
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved exercise as @exercise" do
        post :create, { exercise: invalid_attributes, format: :json  }
        expect(assigns(:exercise)).to be_a_new(Exercise)
      end

      it "returns unprocessable_entity status" do
        post :create, { exercise: invalid_attributes }
        expect(response.status).to eq(422)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { name: "Trizep Push Up", description: "do a full push up and keep your elbows in" }
      }

      it "updates the requested exercise" do
        put :update, { id: exercise.id, exercise: new_attributes, format: :json  }
        exercise.reload
        expect(exercise.name).to eq("Trizep Push Up")
        expect(exercise.description).to eq("do a full push up and keep your elbows in")
      end

      it "assigns the requested exercise as @exercise" do
        put :update, { id: exercise.id, exercise: valid_attributes, format: :json  }
        expect(assigns(:exercise)).to eq(exercise)
      end
    end

    context "with invalid params" do
      it "assigns the exercise as @exercise" do
        put :update, { id: exercise.id, exercise: invalid_attributes, format: :json  }
        expect(assigns(:exercise)).to eq(exercise)
      end

      it "returns unprocessable_entity status" do
        put :update, { id: exercise.id, exercise: invalid_attributes, format: :json }
        expect(response.status).to eq(422)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested exercise" do
      expect {
        delete :destroy, { id: exercise.id, format: :json  }
      }.to change(Exercise, :count).by(-1)
    end

    it "redirects to the exercises list" do
      delete :destroy, { id: exercise.id, format: :json  }
      expect(response.status).to eq(204)
    end
  end

end
