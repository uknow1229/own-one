class PostWorkoutTag < ApplicationRecord
  belongs_to :post_workout
  belongs_to :workout_tags
  validates :post_workout_id , presense:true
  validates :workout_tag_id, presense:true
end
