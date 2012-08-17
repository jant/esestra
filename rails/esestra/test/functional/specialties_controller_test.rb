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

  test 'must get form for new' do
    get :new
    assert_response :success
    assert assigns(:specialty)
    assert_template :form
    assert_select 'h1', 'Specializace'
    assert_select 'form', 1
    assert_select 'input', name: "specialty[name]"
    assert_select 'input', value: "Uložení"
    assert_select 'a', 'Rejstřík'
  end

  test 'must get form for edit' do
    get :edit, {id: specialties('ORL').id.to_s}
    assert_response :success
    assert_equal assigns(:specialty), specialties('ORL')
    assert_template :form
    assert_select 'h1', 'Specializace'
    assert_select 'form', 1
    assert_select 'input', name: "specialty[name]", value: 'ORL'
    assert_select 'input', value: "Uložení"
    assert_select 'a', 'Založení nové'
    assert_select 'a', 'Zrušení'
    assert_select 'a', 'Načtení'
    assert_select 'a', 'Rejstřík'
  end

end
