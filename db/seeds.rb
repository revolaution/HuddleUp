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
user_1 = User.first
chicago = Location.create(name: "Chicago")
sport_1 = Sport.create(name: "Hockey", description: "theres a puck")
