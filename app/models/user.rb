class User < ActiveRecord::Base

  has_many :users_sports
  has_many :sports, through: :users_sports
  has_many :created_games, class_name: "Game"
  has_many :participatings
  has_many :games, through: :participatings
  belongs_to :location
  has_many :memberships
  has_many :teams, through: :memberships

  def self.find_or_create_from_auth_hash(auth_hash)
    user = where(provider: auth_hash.provider, uid: auth_hash.uid).first_or_create
    user_info = user.facebook_email(auth_hash)
    user.update(
        name: auth_hash.info.name,
        image: auth_hash.info.image,
        email: user_info["email"]
      )
    user
  end

  def facebook_email(auth_hash)
    token = auth_hash['credentials']['token']
    @graph = Koala::Facebook::API.new(token)
    @graph.get_object("me?fields=email")
  end

  def games_today
    sorted = self.games.select{|game| game.date == Date.today}
    sort_games(sorted)
  end

  def games_created
    sorted = self.created_games
    sort_games(sorted)
  end

  def games_upcoming
    sorted = self.games.select{|game| game.date > Date.today}
    sort_games(sorted)
  end

  def sort_games(array)
    array.sort{|a,b| b.available_space <=> a.available_space }
  end

  def users_from_previous_games
    players = []
    self.games.each do |game|
      game.participants.each do |participant|
        players.push(participant) if !players.include?(participant) && participant != self
      end
    end
    return players
  end
end
