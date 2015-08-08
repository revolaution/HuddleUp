class User < ActiveRecord::Base

  has_many :users_sports
  has_many :sports, through: :users_sports
  has_many :created_games, class_name: "Game"
  has_many :participatings
  has_many :games, through: :participatings
  belongs_to :location

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

end
