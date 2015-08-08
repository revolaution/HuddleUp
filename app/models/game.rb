class Game < ActiveRecord::Base
  belongs_to :creator, class_name: "User", foreign_key: "user_id"
  has_many :participatings
  has_many :participants, through: :participatings
  belongs_to :sport
end
