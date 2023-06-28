class MealLike < ApplicationRecord
  belongs_to :end_user
  belongs_to :post_meal

  has_one :notification, as: :subject, dependent: :destroy

  after_create_commit :create_notifications

  private
  
  def create_notifications
    Notification.create(subject: self, end_user: self.post_meal.end_user, action_type: :liked_to_meal_post)
  end
end
