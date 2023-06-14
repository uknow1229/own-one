class BlogLike < ApplicationRecord
  belongs_to :end_user
  belongs_to :post_blog

  validates :end_user_id, uniqueness: { scope: :post_blog_id }


  has_one :notification, as: :subject, dependent: :destroy

  after_create_commit :create_notifications

  private
  def create_notifications
    Notification.create(subject: self, end_user: self.post_blog.end_user, action_type: :liked_to_blog_post)
  end
end
