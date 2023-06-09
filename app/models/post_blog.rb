class PostBlog < ApplicationRecord
  has_one_attached :image
  belongs_to :end_user

  has_many :blog_likes, dependent: :destroy
  has_many :blog_comments, dependent: :destroy
  has_many :liked_end_users, through: :blog_likes, source: :end_user
  has_many :commenting_end_users, through: :blog_comments, source: :end_user

  def get_image
    if image.attached?
      image
    else
      'npimage.jpg'
    end
  end
end
