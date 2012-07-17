#encoding: utf-8

require 'test_helper'

class SpecialtyTest < ActiveSupport::TestCase
  test 'fixtures must be valid' do
    assert specialties('ORL').valid?
    assert specialties('Ortopedie').valid?
    assert specialties('Oftalmologie').valid?
  end

  test 'must be invalid if name is not unique' do
    specialty = Specialty.new(name: 'ORL')
    assert specialty.invalid?
    assert_equal 'Specializace se jménem="ORL" již je evidována', specialty.errors[:name].join
  end

  test 'must be invalid if required attributes are not present' do
    specialty = Specialty.new
    assert specialty.invalid?
    assert_equal 'Jméno specializace je povinné', specialty.errors[:name].join
  end

  test 'must be invalid if name is too long' do
    specialty = Specialty.new(name: 'x' * 41)
    assert specialty.invalid?
    assert_equal 'Jméno specializace může obsahovat maximálně 40 znaků', specialty.errors[:name].join
  end
end
