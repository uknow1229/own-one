class Notification < ApplicationRecord

  belongs_to :subject, polymorphic: true
  belongs_to :end_user
  
  enum action_type: { commented_to_workout_post: 0, liked_to_workout_post: 1, commented_to_meal_post: 2, liked_to_meal_post: 3, followed_me: 4 }
end
