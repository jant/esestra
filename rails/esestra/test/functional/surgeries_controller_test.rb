#encoding: utf-8

require 'test_helper'

class SurgeriesControllerTest < ActionController::TestCase

  test "must get index" do
    get :index
    assert_response :success
    assert_equal assigns(:surgeries).count, 3
  end

  test "index must be sorted by name" do
    get :index
    assert_equal assigns(:surgeries)[1].name, 'Odborný oční lékař'
    assert_select 'table tr:nth-child(3) td', 'Odborný oční lékař'
  end

end
