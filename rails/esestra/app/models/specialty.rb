class Specialty < ActiveRecord::Base
  has_many :surgeries, dependent: :restrict

  validates_uniqueness_of :name
  validates_presence_of :name
  validates_length_of :name, maximum: 40
end
