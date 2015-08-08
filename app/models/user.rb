class User < ActiveRecord::Base

  def self.sign_in_from_omniauth(auth_hash)
    find_by(provider: auth_hash['provider'], uid: auth_hash['uid']) || create_user_from_omniauth(auth_hash)
  end

  def self.create_user_from_omniauth(auth_hash)
    create(
        provider: auth_hash['provider'],
        uid: auth_hash['uid'],
        name: auth_hash['info']['name']
      )
  end

  has_many :users_sports
  has_many :sports, through: :users_sports
  has_many :created_games, class_name: "Game"
  has_many :participatings
  has_many :games, through: :participatings

end
