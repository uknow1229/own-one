class MealComment < ApplicationRecord
  belongs_to :end_user, dependent: :destroy
  belongs_to :post_meal, dependent: :destroy
end
