require 'test_helper'

class TelephoneLabelsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:telephone_labels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create telephone_label" do
    assert_difference('TelephoneLabel.count') do
      post :create, :telephone_label => { }
    end

    assert_redirected_to telephone_label_path(assigns(:telephone_label))
  end

  test "should show telephone_label" do
    get :show, :id => telephone_labels(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => telephone_labels(:one).id
    assert_response :success
  end

  test "should update telephone_label" do
    put :update, :id => telephone_labels(:one).id, :telephone_label => { }
    assert_redirected_to telephone_label_path(assigns(:telephone_label))
  end

  test "should destroy telephone_label" do
    assert_difference('TelephoneLabel.count', -1) do
      delete :destroy, :id => telephone_labels(:one).id
    end

    assert_redirected_to telephone_labels_path
  end
end
