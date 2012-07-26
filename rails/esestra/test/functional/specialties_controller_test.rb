require 'test_helper'

class SpecialtiesControllerTest < ActionController::TestCase

  test "must get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:specialties)
    assert_template :index
  end

end
