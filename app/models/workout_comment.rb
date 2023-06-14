class WorkoutComment < ApplicationRecord
  belongs_to :end_user
  belongs_to :post_workout

  has_one :notification, as: :sublect, dependent: :destroy

  after_create_commit :create_notifications

  private
  def create_notifications
    Notification.create(subject: self, end_user: post_workout.end_user, action_type: :commented_to_own_post)
  end
end
