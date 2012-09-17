class OpeningTime < ActiveRecord::Base
  enumerate :day_of_week

  validates_presence_of :day_of_week

end
