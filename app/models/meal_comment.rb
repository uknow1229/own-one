class MealComment < ApplicationRecord
  belongs_to :end_user
  belongs_to :post_meal
end
