class WorkoutMenu < ApplicationRecord
  belongs_to :post_workout, dependent: :destroy
end
