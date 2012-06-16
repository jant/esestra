# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Surgery.delete_all
Specialty.delete_all

Specialty.create(name: 'ORL')
Specialty.create(name: 'ortopedie')
Specialty.create(name: 'oftalmologie')

Surgery.create(name: 'ENT - Med s.r.o., ambulance ORL', specialty: Specialty.find_by_name('ORL'))
# todo napsat data cesky pomoci \u...
Surgery.create(name: 'Ortopedicka ambulance', specialty: Specialty.find_by_name('ortopedie'))
Surgery.create(name: 'Odborny ocni lekar', specialty: Specialty.find_by_name('oftalmologie'))
