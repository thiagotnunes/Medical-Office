require 'test_helper'

class HealthInsurancesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:health_insurances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create health_insurance" do
    assert_difference('HealthInsurance.count') do
      post :create, :health_insurance => { }
    end

    assert_redirected_to health_insurance_path(assigns(:health_insurance))
  end

  test "should show health_insurance" do
    get :show, :id => health_insurances(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => health_insurances(:one).id
    assert_response :success
  end

  test "should update health_insurance" do
    put :update, :id => health_insurances(:one).id, :health_insurance => { }
    assert_redirected_to health_insurance_path(assigns(:health_insurance))
  end

  test "should destroy health_insurance" do
    assert_difference('HealthInsurance.count', -1) do
      delete :destroy, :id => health_insurances(:one).id
    end

    assert_redirected_to health_insurances_path
  end
end
