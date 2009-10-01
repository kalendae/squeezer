require 'test_helper'

class DeviationsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:deviations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create deviation" do
    assert_difference('Deviation.count') do
      post :create, :deviation => { }
    end

    assert_redirected_to deviation_path(assigns(:deviation))
  end

  test "should show deviation" do
    get :show, :id => deviations(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => deviations(:one).to_param
    assert_response :success
  end

  test "should update deviation" do
    put :update, :id => deviations(:one).to_param, :deviation => { }
    assert_redirected_to deviation_path(assigns(:deviation))
  end

  test "should destroy deviation" do
    assert_difference('Deviation.count', -1) do
      delete :destroy, :id => deviations(:one).to_param
    end

    assert_redirected_to deviations_path
  end
end
