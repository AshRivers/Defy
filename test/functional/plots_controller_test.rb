require 'test_helper'

class PlotsControllerTest < ActionController::TestCase
  setup do
    @plot = plots(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:plots)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create plot" do
    assert_difference('Plot.count') do
      post :create, plot: { first_stp: @plot.first_stp, name: @plot.name, user_id: @plot.user_id }
    end

    assert_redirected_to plot_path(assigns(:plot))
  end

  test "should show plot" do
    get :show, id: @plot
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @plot
    assert_response :success
  end

  test "should update plot" do
    put :update, id: @plot, plot: { first_stp: @plot.first_stp, name: @plot.name, user_id: @plot.user_id }
    assert_redirected_to plot_path(assigns(:plot))
  end

  test "should destroy plot" do
    assert_difference('Plot.count', -1) do
      delete :destroy, id: @plot
    end

    assert_redirected_to plots_path
  end
end
