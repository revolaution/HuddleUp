# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

chicago = Location.create(name: "Chicago")
sport1 = Sport.create(name: "Hockey", description: "theres a puck")
sport2 = Sport.create(name: "Baseball", description: "boring as heck")
