require 'test_helper'

class ExercisesControllerTest < ActionController::TestCase

  # called before every single test
  def setup
    @exercise = exercises(:push_up)
  end
 
  # called after every single test
  def teardown
    # as we are re-initializing @exercise_valid before every test
    # setting it to nil here is not essential but I hope
    # you understand how you can use the teardown method
    @exercise = nil
  end
  
  describe "GET #index" do
    it "should responds with a json of exercises" do
      get :index, :format => :json
      response.success?.must_equal true
      body = JSON.parse(response.body)
      body['exercises'].any?{|x| x["name"] == @exercise.name}.must_equal true
    end
  end
  
  describe "GET #show" do
    it "should be successful" do
      get :show, id: @exercise.id, :format => :json
      response.success?.must_equal true
    end

    it "should return the correct exercise when correct id is passed" do
      get :show, id: @exercise.id, :format => :json
      body = JSON.parse(response.body)
      body['exercise']["id"].must_equal @exercise.id
    end

    it "should return 404 if exercise does not exist" do
      get :show, id: 404, :format => :json
      response.not_found?.must_equal true
    end
    
  end

  describe "POST #create" do
    it "should create new valid exercise" do
      assert_difference('Exercise.count') do
        post :create, exercise: { name: @exercise.name, description: @exercise.description, unit: @exercise.unit }
      end

      response.success?.must_equal true
    end
    
    it "should not create exercise with invalid params" do
      assert_no_difference('Exercise.count') do
        post :create, exercise: { name: @exercise.name, description: @exercise.description }
      end

      response.status.must_equal 422
    end
  end

  describe "PATCH #update" do
    it "should update exercise with valid params" do
      patch :update, id: @exercise.id, exercise: { name: "trizep push up", description: @exercise.description, unit: @exercise.unit }
      @exercise.reload
      @exercise.name.must_equal "trizep push up"
      response.success?.must_equal true
    end

    it "should not update exercise with invalid params" do
      patch :update, id: @exercise.id, exercise: { name: "trizep push up", description: @exercise.description, unit: nil }
      @exercise.reload
      @exercise.name.wont_equal "trizep push up"
      response.status.must_equal 422
    end
  end

  describe "DELETE #destroy" do
    it "should delete exercise with valid params" do
      assert_difference('Exercise.count', -1) do
        delete :destroy, id: @exercise.id
      end 
      response.success?.must_equal true
    end

  end
end
