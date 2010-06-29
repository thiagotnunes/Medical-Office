require 'test_helper'

class EvolutionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:evolutions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create evolution" do
    assert_difference('Evolution.count') do
      post :create, :evolution => { }
    end

    assert_redirected_to evolution_path(assigns(:evolution))
  end

  test "should show evolution" do
    get :show, :id => evolutions(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => evolutions(:one).id
    assert_response :success
  end

  test "should update evolution" do
    put :update, :id => evolutions(:one).id, :evolution => { }
    assert_redirected_to evolution_path(assigns(:evolution))
  end

  test "should destroy evolution" do
    assert_difference('Evolution.count', -1) do
      delete :destroy, :id => evolutions(:one).id
    end

    assert_redirected_to evolutions_path
  end
end
