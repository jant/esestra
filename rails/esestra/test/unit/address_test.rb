#encoding: utf-8

require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  test 'fixtures must be valid' do
    assert addresses('Dobrovskeho').valid?
    assert addresses('Pionyrska').valid?
    assert addresses('Ceska').valid?
  end

  test 'must be invalid if required attributes are not present' do
    address = Address.new
    assert address.invalid?
    assert_equal 'Město v adrese je povinné', address.errors[:city].join
    assert_equal 'Ulice v adrese je povinná', address.errors[:street].join
  end

  test 'must be invalid if city is too long' do
    address = Address.new(city: 'x' * 201)
    assert address.invalid?
    assert_equal 'Město v adrese může obsahovat maximálně 200 znaků', address.errors[:city].join
  end

  test 'must be invalid if street is too long' do
    address = Address.new(street: 'x' * 201)
    assert address.invalid?
    assert_equal 'Ulice v adrese může obsahovat maximálně 200 znaků', address.errors[:street].join
  end

end

