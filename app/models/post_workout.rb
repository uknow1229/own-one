class PostWorkout < ApplicationRecord
  has_one_attached :image
  belongs_to :end_user

  has_many :workout_likes, dependent: :destroy
  has_many :workout_comments, dependent: :destroy
  has_many :workout_menus, dependent: :destroy
  has_many :liked_end_users, through: :workout_likes, source: :end_user
  has_many :commenting_end_users, through: :workout_comments, source: :end_user
end
