class MealTag < ApplicationRecord
  has_many :post_meal_tags, dependent: :destroy
  has_many :post_meals, through: :post_meal_tags

  validates :name, presence:true, length:{maximum:50}
end
