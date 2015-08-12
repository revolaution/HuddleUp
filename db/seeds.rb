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

sport_1 = Sport.create(name: "Basketball", image_path: "basketball.png")
sport_2 = Sport.create(name: "Volleyball", image_path: "volleyball.png")
sport_3 = Sport.create(name: "Football", image_path: "football.png")
sport_4 = Sport.create(name: "Frisbee", image_path: "frisbee.png")
sport_5 = Sport.create(name: "Soccer", image_path: "soccer.png")
sport_6 = Sport.create(name: "Tennis", image_path: "tennis.png")
sport_7 = Sport.create(name: "Hockey", image_path: "puck.png")
sport_8 = Sport.create(name: "Baseball", image_path: "baseball.png")
