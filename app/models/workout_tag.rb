class WorkoutTag < ApplicationRecord
  has_many :post_workout_tags, dependent: :destroy
  has_many :post_workouts, through: :post_workout_tags

  validates :name, presence:true, length:{maximum:50}
end
