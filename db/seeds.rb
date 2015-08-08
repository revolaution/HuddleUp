# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

chicago = Location.create(name: "Chicago")
mike = User.create(name: "mike", password_digest: "test", email: "mike@test.com", location: chicago)
fu = User.create(name: "fu", password_digest: "test", email: "fu@test.com", location: chicago)
sport1 = Sport.create(name: "Hockey", description: "theres a puck")
sport2 = Sport.create(name: "Baseball", description: "boring as heck")
UsersSport.create(user: mike, sport: sport1, skill_level: "Beginner")
UsersSport.create(user: fu, sport: sport1, skill_level: "Expert")
UsersSport.create(user: mike, sport: sport2, skill_level: "Expert")
UsersSport.create(user: fu, sport: sport2, skill_level: "Beginner")
game1 = Game.create(description: "playing today!", creator: mike, sport: sport1, location: chicago, address: "soldier field")
game2 = Game.create(description: "playing today!", creator: fu, sport: sport2, location: chicago, address: "by the bean")
Participating.create(participant: mike, game: game1)
Participating.create(participant: fu, game: game1)
