class PostMealTag < ApplicationRecord
  belongs_to :post_meal
  belongs_to :meal_tag
end
