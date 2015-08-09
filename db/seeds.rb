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

sport_1 = Sport.create(name: "Basketball", description: "Ex choro perfecto sed, ei laoreet atomorum convenire vim. Est soluta laoreet deterruisset ad. At sea paulo libris, id usu paulo simul, in mel oratio malorum delenit. Cu dicant philosophia cum. Ad eos oblique pertinacia.")
sport_2 = Sport.create(name: "Volleyball", description: "Ex choro perfecto sed, ei laoreet atomorum convenire vim. Est soluta laoreet deterruisset ad. At sea paulo libris, id usu paulo simul, in mel oratio malorum delenit. Cu dicant philosophia cum. Ad eos oblique pertinacia.")
sport_3 = Sport.create(name: "Football", description: "Ex choro perfecto sed, ei laoreet atomorum convenire vim. Est soluta laoreet deterruisset ad. At sea paulo libris, id usu paulo simul, in mel oratio malorum delenit. Cu dicant philosophia cum. Ad eos oblique pertinacia.")
sport_4 = Sport.create(name: "Ultimate Frisbee", description: "Ex choro perfecto sed, ei laoreet atomorum convenire vim. Est soluta laoreet deterruisset ad. At sea paulo libris, id usu paulo simul, in mel oratio malorum delenit. Cu dicant philosophia cum. Ad eos oblique pertinacia.")
sport_5 = Sport.create(name: "Soccer", description: "Ex choro perfecto sed, ei laoreet atomorum convenire vim. Est soluta laoreet deterruisset ad. At sea paulo libris, id usu paulo simul, in mel oratio malorum delenit. Cu dicant philosophia cum. Ad eos oblique pertinacia.")
sport_6 = Sport.create(name: "Tennis", description: "Ex choro perfecto sed, ei laoreet atomorum convenire vim. Est soluta laoreet deterruisset ad. At sea paulo libris, id usu paulo simul, in mel oratio malorum delenit. Cu dicant philosophia cum. Ad eos oblique pertinacia.")
sport_7 = Sport.create(name: "Hockey", description: "Ex choro perfecto sed, ei laoreet atomorum convenire vim. Est soluta laoreet deterruisset ad. At sea paulo libris, id usu paulo simul, in mel oratio malorum delenit. Cu dicant philosophia cum. Ad eos oblique pertinacia.")
sport_8 = Sport.create(name: "Baseball", description: "Ex choro perfecto sed, ei laoreet atomorum convenire vim. Est soluta laoreet deterruisset ad. At sea paulo libris, id usu paulo simul, in mel oratio malorum delenit. Cu dicant philosophia cum. Ad eos oblique pertinacia.")
sport_9 = Sport.create(name: "Miscellaneous", description: "Ex choro perfecto sed, ei laoreet atomorum convenire vim. Est soluta laoreet deterruisset ad. At sea paulo libris, id usu paulo simul, in mel oratio malorum delenit. Cu dicant philosophia cum. Ad eos oblique pertinacia.")

