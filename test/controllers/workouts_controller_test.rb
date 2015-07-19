require 'test_helper'

class WorkoutsControllerTest < ActionController::TestCase
  def setup
    @workout = workouts(:one)
  end

  def teardown
    @workout = nil
  end

  describe "GET #index" do
    it "should responds with a json of workouts" do
      get :index, format: :json
      response.success?.must_equal true
      body = JSON.parse(response.body)
      body['workouts'].any?{|x| x['day'].to_s == @workout.day.to_s}.must_equal true
    end
  end

  describe "GET #show" do
    it "should be successful" do
      get :show, id: @workout.id, format: :json
      response.success?.must_equal true
    end

    it "should return the correct workout when correct id is passed" do
      get :show, id: @workout, format: :json
      body = JSON.parse(response.body)
      body['workout']['id'].must_equal @workout.id
    end

    it "should return 404 if workout does not exist" do
      get :show, id: 404, format: :json
      response.not_found?.must_equal true
    end
  end

  describe "POST #create" do
    it "should create new valid workout" do
      assert_difference('Workout.count') do
        monday = trainingsdays(:monday)
        post :create, workout: { day: Date.today, trainingsday_id: monday.id }
      end
      response.success?.must_equal true
    end

    it "should not create workout with invalid params" do
      assert_no_difference('Workout.count') do
        post :create, workout: {day: Date.today}
      end
      response.status.must_equal 422
    end
  end

  describe "PATCH #update" do
    it "should update exercise with valid params" do
      patch :update, id: @workout.id, workout: {day: Date.today}
      @workout.reload
      @workout.day.must_equal Date.today
      response.success?.must_equal true
    end

    it "should not update workout with invalid params" do
      patch :update, id: @workout.id, workout: {day: Date.today, trainingsday_id: nil}
      @workout.reload
      @workout.day.wont_equal Date.today
      response.status.must_equal 422
    end
  end

  describe "DELETE #destroy" do
    it "should delete workout" do
      assert_difference('Workout.count', -1) do
        delete :destroy, id: @workout.id
      end
      response.success?.must_equal true
    end
  end

end
