class PostMeal < ApplicationRecord
  has_one_attached :image
  belongs_to :end_user

  has_many :meal_likes, dependent: :destroy
  has_many :meal_comments, dependent: :destroy
  has_many :meal_menus, dependent: :destroy
  has_many :liked_end_users, through: :meal_likes, source: :end_user
  has_many :commenting_end_users, through: :meal_comments, source: :end_user

  has_many :post_meal_tags, dependent: :destroy
  has_many :meal_tags, through: :post_meal_tags

  enum timing: { breakfast: 0, lunch: 1, dinner: 2, snacking: 3 }
  enum meal_type: { cooking_for_oneself: 0, eating_out: 1, takeout: 2, convenience_store: 3 }
  
  def liked_by?(end_user)
    meal_likes.exists?(end_user_id: end_user.id)
  end

  def get_image(width, height)
    if image.attached?
      image.variant(resize_to_limit: [100, 100]).processed
    else
      'noimage.jpg'
    end
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "memo"]
  end

end
