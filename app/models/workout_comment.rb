class WorkoutComment < ApplicationRecord
  belongs_to :end_user
  belongs_to :post_workout
end
