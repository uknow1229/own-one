class PostMealTag < ApplicationRecord
  belongs_to :post_meal
  belongs_to :meal_tag

  validates :meal_tag_id, presence: true
  validates :post_meal_id, presence: true

end
