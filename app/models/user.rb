class User < ActiveRecord::Base
  has_many :users_sports
  has_many :sports, through: :users_sports
  has_many :created_games, class_name: "Game"
  has_many :participatings
  has_many :games, through: :participatings
end
