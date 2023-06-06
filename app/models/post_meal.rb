class PostMeal < ApplicationRecord
  has_one_attached :image

  has_many :meal_likes, dependent: :destroy
  has_many :mael_comments, dependent: :destroy
  has_many :mael_menus, dependent: :destroy
end
