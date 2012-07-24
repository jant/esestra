class Address < ActiveRecord::Base
  has_one :surgery, dependent: :restrict

  validates_presence_of :city, :street, :surgery
  validates_length_of :city, maximum: 200
  validates_length_of :street, maximum: 200
end
