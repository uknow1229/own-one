class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "EndUser"
  belongs_to :followed, class_name: "EndUser"

  has_one :notification, as: :subject, dependent: :destroy

  after_create_commit :create_notifications

  private

  def create_notifications
    Notification.create(subject: self, end_user: followed, action_type: :followed_me)
  end
end
