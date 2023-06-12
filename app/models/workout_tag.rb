class WorkoutTag < ApplicationRecord
  validates :name, presense:true, length:{maximam:50}
  has_many :post_workout, through: :post_workout_tags
  has_many :post_workout_tags, dependent: :destroy
end
