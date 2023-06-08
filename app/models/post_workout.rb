class PostWorkout < ApplicationRecord
  has_one_attached :image
  belongs_to :end_user

  has_many :workout_likes, dependent: :destroy
  has_many :workout_comments, dependent: :destroy
  has_many :workout_menus, dependent: :destroy
  has_many :liked_end_users, through: :workout_likes, source: :end_user
  has_many :commenting_end_users, through: :workout_comments, source: :end_user

  enum site: { shoulder: 0, arm: 1, chest: 2, back: 3, belly: 4, buttocks: 5, thigh: 6, calf: 7, the_upper_body: 8, lower_half_of_the_body: 9 }

end
