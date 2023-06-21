class PostWorkoutTag < ApplicationRecord
  belongs_to :post_workout
  belongs_to :workout_tag
end
