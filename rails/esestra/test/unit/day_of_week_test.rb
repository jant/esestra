#encoding: utf-8

require 'test_helper'

class DayOfWeekTest < ActiveSupport::TestCase
  test 'must return pondeli for 1' do
    assert 'pondělí', DayOfWeek[1]
  end
  test 'must return nil for 8' do
    assert 'pondělí', DayOfWeek[8]
  end

end
