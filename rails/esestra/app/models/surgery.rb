class Surgery < ActiveRecord::Base
  belongs_to :specialty
  belongs_to :address, dependent: :delete

  validates_uniqueness_of :name
  validates_presence_of :name, :specialty, :address
  validates_length_of :name, maximum: 40
  validates_length_of :phone, maximum: 200
  validates_length_of :email, maximum: 200
  validates_length_of :web, maximum: 200
  validates_length_of :open_mo, maximum: 40
  validates_length_of :open_tu, maximum: 40
  validates_length_of :open_we, maximum: 40
  validates_length_of :open_th, maximum: 40
  validates_length_of :open_fr, maximum: 40
  validates_length_of :open_sa, maximum: 40
  validates_length_of :open_su, maximum: 40
  validates_length_of :break, maximum: 40

end
