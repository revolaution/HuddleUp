class Sport < ActiveRecord::Base
  has_many :users_sports
  has_many :users, through: :users_sports
  has_many :games
end
