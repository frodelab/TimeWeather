# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
cities = [
  {
    name: 'Santiago',
    short_name: 'CL',
    latitude: '-33.4724728',
    longitude: '-70.9100246'
  },
  {
    name: 'Zurich',
    short_name: 'CH',
    latitude: '47.3774337',
    longitude: '8.4666758'
  },
  {
    name: 'Auckland',
    short_name: 'NZ',
    latitude: '-36.8626942',
    longitude: '174.5852779'
  },
  {
    name: 'Sydney',
    short_name: 'AU',
    latitude: '-33.847927',
    longitude: '150.6517817'
  },
  {
    name: 'Londres',
    short_name: 'UK',
    latitude: '51.528308',
    longitude: '-0.3817803'
  },
  {
    name: 'Georgia',
    short_name: 'USA',
    latitude: '32.6581527',
    longitude: '-85.422288'
  }
]

cities.each do |city|
  City.find_or_create_by(
    name: city[:name],
    short_name: city[:short_name],
    latitude: city[:latitude],
    longitude: city[:longitude]
  )
end
