#encoding: utf-8


class OpeningTime < ActiveRecord::Base
  enumerate :day_of_week
  belongs_to :surgery

  validates_presence_of :day_of_week
  validates_presence_of :surgery
  validates_presence_of :begin
  validates_presence_of :end
  validates_length_of :note, maximum: 40
  validate :begin_must_be_less_than_end
  validate :begin_must_be_rounded_to_quarters

  def begin_must_be_less_than_end
    if not self.begin.nil? and not self.end.nil?
      errors[:base] << I18n.t('activerecord.errors.models.opening_time.base.begin_must_be_less_than_end') unless self.begin < self.end
    end
  end

  def begin_must_be_rounded_to_quarters
    if not self.begin.nil?
      errors[:base] << I18n.t('activerecord.errors.models.opening_time.base.begin_must_be_rounded_to_quarters') unless self.begin == round_time_to_quarter(self.begin)
    end
  end

  # viz http://stackoverflow.com/questions/449271/how-to-round-a-time-down-to-the-nearest-15-minutes-in-ruby
  def round_time_to_quarter(t)
    Time.at(t.to_i - t.sec - t.min % 15 * 60)
  end

end
