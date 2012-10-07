class Surgery < ActiveRecord::Base
  belongs_to :specialty
  belongs_to :address, dependent: :delete
  has_many :opening_times, dependent: :delete_all

  validates_uniqueness_of :name
  validates_presence_of :name, :specialty, :address
  validates_length_of :name, maximum: 40
  validates_length_of :phone, maximum: 200
  validates_length_of :email, maximum: 200
  validates_length_of :web, maximum: 200

end
