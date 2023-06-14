class WorkoutLike < ApplicationRecord
  belongs_to :end_user
  belongs_to :post_workout

  has_one :notification, as: :subject, dependent: :destroy

  after_create_commit :create_notifications

  private
  def create_notifications
    Notification.create(subject: self, end_user: self.post_workout.end_user, action_type: :liked_to_own_post)
  end
end
