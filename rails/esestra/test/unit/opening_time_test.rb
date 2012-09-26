#encoding: utf-8

require 'test_helper'

class OpeningTimeTest < ActiveSupport::TestCase
  test 'fixtures must be valid' do
    assert opening_times('ORL_mo_1').valid?
    assert opening_times('ORL_mo_2').valid?
    assert opening_times('ORL_mo_3').valid?
    assert opening_times('ORL_tu_1').valid?
    assert opening_times('ORL_tu_2').valid?
    assert opening_times('Ortopedie_mo_1').valid?
  end

  test 'opening time must be invalid if required attributes are not present' do
    opening_time = OpeningTime.new
    assert opening_time.invalid?
    assert_equal 'Den v týdnu je povinný', opening_time.errors[:day_of_week].first
    assert_equal 'Ordinace je povinná', opening_time.errors[:surgery].first
    assert_equal 'Začátek otevírací doby je povinný', opening_time.errors[:begin].first
    assert_equal 'Konec otevírací doby je povinný', opening_time.errors[:end].first
  end

  test 'opening time must be invalid if note is too long' do
    opening_time = OpeningTime.new(note: 'x' * 41)
    assert opening_time.invalid?
    assert_equal 'Poznámka k otevírací době může obsahovat maximálně 40 znaků', opening_time.errors[:note].first
  end

  test 'opening time begin must be less than end' do
    opening_time = opening_times('ORL_mo_1')
    opening_time.end = Time.new(2000,1,1,8,0,0)
    assert opening_time.invalid?
    assert_equal 'Začátek otevírací doby musí být dříve než konec', opening_time.errors[:base].first
    opening_time.end = Time.new(2000,1,1,7,30,0)
    assert opening_time.invalid?
    assert_equal 'Začátek otevírací doby musí být dříve než konec', opening_time.errors[:base].first
  end

  test 'opening time begin must be rounded to quarters' do
    opening_time = opening_times('ORL_mo_1')
    opening_time.begin = Time.new(2000,1,1,8,13,0)
    assert opening_time.invalid?
    assert_equal 'Začátek otevírací doby musí být zaokrouhlený na čtvrthodiny', opening_time.errors[:base].first
  end


end
