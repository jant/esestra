class Specialty < ActiveRecord::Base
  validates_uniqueness_of :name
  validates_presence_of :name
  validates_length_of :name, maximum: 40
end
