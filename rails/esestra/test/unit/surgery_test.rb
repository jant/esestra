#encoding: utf-8

require 'test_helper'

class SurgeryTest < ActiveSupport::TestCase
  test 'fixtures must be valid' do
    assert surgeries('ORL').valid?
    assert surgeries('Ortopedie').valid?
    assert surgeries('Oftalmologie').valid?
  end

  test 'must be invalid if name is not unique' do
    surgery = Surgery.new(name: 'Ortopedická ambulance')
    assert surgery.invalid?
    assert_equal 'Ordinace se jménem="Ortopedická ambulance" již je evidována', surgery.errors[:name].first
  end

  test 'must be invalid if required attributes are not present' do
    surgery = Surgery.new
    assert surgery.invalid?
    assert_equal 'Jméno ordinace je povinné', surgery.errors[:name].first
    assert_equal 'Specializace ordinace je povinná', surgery.errors[:specialty].first
    assert_equal 'Adresa ordinace je povinná', surgery.errors[:address].first
  end

  test 'must be invalid if name is too long' do
    surgery = Surgery.new(name: 'x' * 41)
    assert surgery.invalid?
    assert_equal 'Jméno ordinace může obsahovat maximálně 40 znaků', surgery.errors[:name].first
  end

  test 'must be invalid if phone is too long' do
    surgery = Surgery.new(phone: 'x' * 201)
    assert surgery.invalid?
    assert_equal 'Telefon ordinace může obsahovat maximálně 200 znaků', surgery.errors[:phone].first
  end

  test 'must be invalid if email is too long' do
    surgery = Surgery.new(email: 'x' * 201)
    assert surgery.invalid?
    assert_equal 'Email ordinace může obsahovat maximálně 200 znaků', surgery.errors[:email].first
  end

  test 'must be invalid if web is too long' do
    surgery = Surgery.new(web: 'x' * 201)
    assert surgery.invalid?
    assert_equal 'Web ordinace může obsahovat maximálně 200 znaků', surgery.errors[:web].first
  end

  test 'must destroy also his component address' do
    surgery = surgeries('ORL')
    s_count = Surgery.count
    a_count = Address.count
    surgery.destroy
    assert_equal s_count-1, Surgery.count
    assert_equal a_count-1, Address.count
  end

end
