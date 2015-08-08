class Participating < ActiveRecord::Base
  belongs_to :game
  belongs_to :participant, class_name: "User", foreign_key: "user_id"
end
