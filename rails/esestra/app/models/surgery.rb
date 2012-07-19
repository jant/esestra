class Surgery < ActiveRecord::Base
  belongs_to :specialty

  validates_uniqueness_of :name
  validates_presence_of :name, :specialty
  validates_length_of :name, maximum: 40
  validates_length_of :phone, maximum: 200
  validates_length_of :email, maximum: 200
  validates_length_of :web, maximum: 200

end
