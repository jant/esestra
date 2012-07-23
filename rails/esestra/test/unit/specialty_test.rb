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
    assert_equal 'Specializace se jménem="ORL" již je evidována', specialty.errors[:name].first
  end

  test 'must be invalid if required attributes are not present' do
    specialty = Specialty.new
    assert specialty.invalid?
    assert_equal 'Jméno specializace je povinné', specialty.errors[:name].first
  end

  test 'must be invalid if name is too long' do
    specialty = Specialty.new(name: 'x' * 41)
    assert specialty.invalid?
    assert_equal 'Jméno specializace může obsahovat maximálně 40 znaků', specialty.errors[:name].first
  end

  test 'must not destroy if has children' do
    # ve verzi rails 3.2.6 destroy pri poruseni dependent restrict zveda vyjimku
    # v dalsich verzich rails jiz nebude zvedat vyjimku, ale bude zapisovat do errors[:base] danou chybu. Mozna to bude zaviset na parametru dependent_restrict_raises...
    # take by melo byt mozne chybove hlaseni osetrit pomoci I18n
    count = Specialty.count
    specialty = specialties('ORL')
    begin
      specialty.destroy
    rescue ActiveRecord::DeleteRestrictionError => e
      assert_equal "Cannot delete record because of dependent surgeries", e.message
    end
    assert_equal count, Specialty.count
  end
end
