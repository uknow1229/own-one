class WorkoutLike < ApplicationRecord
  belongs_to :end_user, dependent: :destroy
  belongs_to :post_workout, dependent: :destroy
end
