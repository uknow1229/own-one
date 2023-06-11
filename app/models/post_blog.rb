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

  def get_image(width, height)
    if image.attached?
      image.variant(resize_to_limit: [100, 100]).processed
    else
      'noimage.jpg'
    end
  end


  def self.ransackable_attributes(auth_object = nil)
    [ "title"]
  end

end
