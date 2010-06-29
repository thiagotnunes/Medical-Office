require 'test_helper'

class EvolutionPicturesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:evolution_pictures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create evolution_picture" do
    assert_difference('EvolutionPicture.count') do
      post :create, :evolution_picture => { }
    end

    assert_redirected_to evolution_picture_path(assigns(:evolution_picture))
  end

  test "should show evolution_picture" do
    get :show, :id => evolution_pictures(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => evolution_pictures(:one).id
    assert_response :success
  end

  test "should update evolution_picture" do
    put :update, :id => evolution_pictures(:one).id, :evolution_picture => { }
    assert_redirected_to evolution_picture_path(assigns(:evolution_picture))
  end

  test "should destroy evolution_picture" do
    assert_difference('EvolutionPicture.count', -1) do
      delete :destroy, :id => evolution_pictures(:one).id
    end

    assert_redirected_to evolution_pictures_path
  end
end
