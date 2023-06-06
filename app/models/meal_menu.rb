class MealMenu < ApplicationRecord
  belongs_to :post_meal, dependent: :destroy
end
