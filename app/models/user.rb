class User < ActiveRecord::Base
  # def self.from_omniauth(auth)
  #   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  #     user.provider   = auth.provider
  #     user.uid        = auth.uid
  #     user.name       = auth.info.name
  #     user.email      = auth.info.email
  #     user.location   = auth.info.location
  #     user.image      = auth.info.image
  #     user.token      = auth.credentials.token
  #     user.expires_at = auth.credentials.expires_at
  #     user.save
  #   end
  # end
  # def self.find_or_create_from_auth_hash(auth_hash)
  #   user = where(provider: auth_hash.provider, uid: auth_hash.uid).first_or_create
  #   user.update(
  #     name: auth_hash.info.name,
  #     email: auth.info.email
  #     # location: auth.info.location
  #     image: auth.info.image
  #     # token: auth.credentials.token
  #     # expires_at: auth.credentials.expires_at
  #     )
  #   user
  # end

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
end
