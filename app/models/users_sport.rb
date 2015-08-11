class UsersSport < ActiveRecord::Base
  belongs_to :sport
  belongs_to :user

  validates :skill_level, :inclusions=> { :in => ["Beginner", "Intermediate", "Pro"]}
end
