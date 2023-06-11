class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  has_one_attached :profile_image
  has_many :post_workouts, dependent: :destroy

  has_many :workout_likes, dependent: :destroy
  has_many :workout_comments, dependent: :destroy

  has_many :meal_likes, dependent: :destroy
  has_many :meal_comments, dependent: :destroy

  has_many :blog_likes, dependent: :destroy
  has_many :like_post_blogs, through: :blog_likes, source: :post_blog
  has_many :blog_comments, dependent: :destroy

  # has_many :post_workouts, through: :workout_likes
  # has_many :post_workouts, through: :workout_comments

  enum sex: { woman: 0, man: 1, neither: 2, no_answer: 3 }
  enum activelevel: { level1: 0, level2: 1, level3: 2 }

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |end_user|
      end_user.password = SecureRandom.urlsafe_base64
    end
  end

  def full_name
    (self.first_name || "") + " " + (self.last_name || "")
  end

  def active_for_authentication?
    super && (is_deleted == false)
  end

  def get_profile_image
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/noimage.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [50, 50]).processed
  end

end
