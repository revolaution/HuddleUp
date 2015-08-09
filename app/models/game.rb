class Game < ActiveRecord::Base
  belongs_to :creator, class_name: "User", foreign_key: "user_id"
  has_many :participatings
  has_many :participants, through: :participatings
  belongs_to :sport
  belongs_to :location

  def current_participants_count
    self.participants.count
  end

  def not_full?
    self.current_participants_count != self.max_number_of_participants
  end
end
