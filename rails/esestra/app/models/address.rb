class Address < ActiveRecord::Base
  validates_presence_of :city, :street
  validates_length_of :city, maximum: 200
  validates_length_of :street, maximum: 200
end
