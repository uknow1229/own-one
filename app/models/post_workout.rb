class PostWorkout < ApplicationRecord
  has_one_attached :image

  has_many :workout_likes, dependent: :destroy
  has_many :workout_comments, dependent: :destroy
  has_many :workout_menus, dependent: :destroy
end
