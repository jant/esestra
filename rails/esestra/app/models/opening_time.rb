class OpeningTime < ActiveRecord::Base
  enumerate :day_of_week
  belongs_to :surgery

  validates_presence_of :day_of_week
  validates_presence_of :surgery
  validates_presence_of :begin
  validates_presence_of :end

end
