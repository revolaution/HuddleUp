# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Location.destroy_all
Sport.destroy_all
Participating.destroy_all
Game.destroy_all

chicago = Location.create(name: "Chicago")
san_fran = Location.create(name: "San Fransisco")
nyc = Location.create(name: "New York City")

sport_1 = Sport.create(name: "Basketball")
sport_2 = Sport.create(name: "Volleyball")
sport_3 = Sport.create(name: "Football")
sport_4 = Sport.create(name: "Ultimate Frisbee")
sport_5 = Sport.create(name: "Soccer")
sport_6 = Sport.create(name: "Tennis")
sport_7 = Sport.create(name: "Hockey")
sport_8 = Sport.create(name: "Baseball")
sport_9 = Sport.create(name: "Miscellaneous")

