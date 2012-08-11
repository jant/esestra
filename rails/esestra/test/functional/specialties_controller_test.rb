#encoding: utf-8

require 'test_helper'

class SpecialtiesControllerTest < ActionController::TestCase

  test "must get index" do
    get :index
    assert_response :success
    assert_equal assigns(:specialties).count, 5
    assert_template :index
    assert_select 'h1', 'Rejstřík specializací'
    assert_select 'table tr th', 'Jméno'
    assert_select 'table tr', 6
    assert_select 'table tr td', 'Oftalmologie'
    assert_select 'a', 'Změna'
    assert_select 'a', 'Zrušení'
    assert_select 'a', 'Založení nové'
  end

  test "index must be sorted by name" do
    get :index
    assert_equal assigns(:specialties)[1].name, 'ORL'
    assert_select 'table tr:nth-child(3) td', 'ORL'
  end

end
