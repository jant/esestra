#encoding: utf-8

require 'test_helper'

class SurgeriesControllerTest < ActionController::TestCase

  test "must get index" do
    get :index
    assert_response :success
    assert_equal assigns(:surgeries).count, 3
  end

  test "index must be sorted by specialty name and name" do
    get :index
    assert_equal assigns(:surgeries)[0].name, 'Odborný oční lékař'
    assert_select '#surgeries .surgery .name', 'Odborný oční lékař'
  end

end
