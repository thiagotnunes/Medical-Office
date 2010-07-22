require 'test_helper'

class AddressLabelsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:address_labels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create address_label" do
    assert_difference('AddressLabel.count') do
      post :create, :address_label => { }
    end

    assert_redirected_to address_label_path(assigns(:address_label))
  end

  test "should show address_label" do
    get :show, :id => address_labels(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => address_labels(:one).to_param
    assert_response :success
  end

  test "should update address_label" do
    put :update, :id => address_labels(:one).to_param, :address_label => { }
    assert_redirected_to address_label_path(assigns(:address_label))
  end

  test "should destroy address_label" do
    assert_difference('AddressLabel.count', -1) do
      delete :destroy, :id => address_labels(:one).to_param
    end

    assert_redirected_to address_labels_path
  end
end
