#encoding: utf-8

require 'test_helper'

class SpecialtyTest < ActiveSupport::TestCase
  test 'fixtures must be valid' do
    assert specialties('ORL').valid?
    assert specialties('Ortopedie').valid?
    assert specialties('Oftalmologie').valid?
  end

  test 'uniqueness' do
    specialty = Specialty.new(name: 'ORL')
    assert specialty.invalid?
    assert_equal "Specializace se jménem=[ORL] již je evidována", specialty.errors[:name].join
  end

  test 'name is required' do
    specialty = Specialty.new()
    assert specialty.invalid?
    assert_equal 'Jméno specializace je povinné', specialty.errors[:name].join
  end

  test 'name max length' do
    specialty = Specialty.new(name: 'a' * 41)
    assert specialty.invalid?
    assert_equal 'Jméno specializace může obsahovat maximálně 40 znaků', specialty.errors[:name].join
  end
end
