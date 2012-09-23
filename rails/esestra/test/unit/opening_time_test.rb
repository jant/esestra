#encoding: utf-8

require 'test_helper'

class OpeningTimeTest < ActiveSupport::TestCase
  test 'fixtures must be valid' do
    assert opening_times('ORL_mo_1').valid?
    assert opening_times('ORL_tu_1').valid?
    assert opening_times('Ortopedie_mo_1').valid?
  end

  test 'must be invalid if required attributes are not present' do
    opening_time = OpeningTime.new
    assert opening_time.invalid?
    assert_equal 'Den v týdnu je povinný', opening_time.errors[:day_of_week].first
    assert_equal 'Ordinace je povinná', opening_time.errors[:surgery].first
    assert_equal 'Začátek otevírací doby je povinný', opening_time.errors[:begin].first
    assert_equal 'Konec otevírací doby je povinný', opening_time.errors[:end].first
  end

end
