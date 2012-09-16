class DayOfWeek < ActiveEnum::Base
  value id: 1, name: 'monday', abbreviation: 'mo'
  value id: 2, name: 'tuesday', abbreviation: 'tu'
  value id: 3, name: 'wednesday', abbreviation: 'we'
  value id: 4, name: 'thursday', abbreviation: 'th'
  value id: 5, name: 'friday', abbreviation: 'fr'
  value id: 6, name: 'saturday', abbreviation: 'sa'
  value id: 7, name: 'sunday', abbreviation: 'su'
end