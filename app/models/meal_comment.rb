class MealComment < ApplicationRecord
  belongs_to :end_user
  belongs_to :post_meal

  has_one :notification, as: :subject, dependent: :destroy

  validates :comment, presence: true

  after_create_commit :create_notifications

  private

  def create_notifications
    Notification.create(subject: self, end_user: post_meal.end_user, action_type: :commented_to_meal_post)
  end
end
