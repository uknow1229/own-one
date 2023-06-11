class PostBlog < ApplicationRecord
  has_one_attached :image
  belongs_to :end_user

  has_many :blog_likes, dependent: :destroy
  has_many :blog_comments, dependent: :destroy
  has_many :liked_end_users, through: :blog_likes, source: :end_user
  has_many :commenting_end_users, through: :blog_comments, source: :end_user

  def liked_by?(end_user)
    blog_likes.exists?(end_user_id: end_user.id)
  end

  def get_image
    if image.attached?
      image
    else
      'noimage.jpg'
    end
  end
end
