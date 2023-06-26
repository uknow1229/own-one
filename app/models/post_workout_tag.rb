class PostWorkoutTag < ApplicationRecord
  belongs_to :post_workout
  belongs_to :workout_tag

  validates :post_workout_id, presence: true
  validates :workout_tag_id, presence: true

end
