#encoding: utf-8

require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  test 'fixtures must be valid' do
    assert addresses('ORL').valid?
    assert addresses('Ortopedie').valid?
    assert addresses('Oftalmologie').valid?
  end

  test 'must be invalid if required attributes are not present' do
    address = Address.new
    assert address.invalid?
    assert_equal 'Město v adrese je povinné', address.errors[:city].first
    assert_equal 'Ulice v adrese je povinná', address.errors[:street].first
    assert_not_nil address.errors[:surgery].first
  end

  test 'must be invalid if city is too long' do
    address = Address.new(city: 'x' * 201)
    assert address.invalid?
    assert_equal 'Město v adrese může obsahovat maximálně 200 znaků', address.errors[:city].first
  end

  test 'must be invalid if street is too long' do
    address = Address.new(street: 'x' * 201)
    assert address.invalid?
    assert_equal 'Ulice v adrese může obsahovat maximálně 200 znaků', address.errors[:street].first
  end

  test 'must not destroy because it is component of address' do
    count = Address.count
    address = addresses('ORL')
    begin
      address.destroy
    rescue ActiveRecord::DeleteRestrictionError => e
      assert_equal "Cannot delete record because of dependent surgery", e.message
    end
    assert_equal count, Address.count
  end

end

