#encoding: utf-8

require 'test_helper'

class AdressTest < ActiveSupport::TestCase
  test 'fixtures must be valid' do
    assert adresses('Dobrovskeho').valid?
    assert adresses('Pionyrska').valid?
    assert adresses('Ceska').valid?
  end

  test 'must be invalid if required attributes are not present' do
    adress = Adress.new
    assert adress.invalid?
    assert_equal 'Město v adrese je povinné', adress.errors[:city].join
    assert_equal 'Ulice v adrese je povinná', adress.errors[:street].join
  end

  test 'must be invalid if city is too long' do
    adress = Adress.new(city: 'x' * 201)
    assert adress.invalid?
    assert_equal 'Město v adrese může obsahovat maximálně 200 znaků', adress.errors[:city].join
  end

  test 'must be invalid if street is too long' do
    adress = Adress.new(street: 'x' * 201)
    assert adress.invalid?
    assert_equal 'Ulice v adrese může obsahovat maximálně 200 znaků', adress.errors[:street].join
  end

end

