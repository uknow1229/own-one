class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  has_one_attached :profile_image

  has_many :post_workouts, dependent: :destroy
  has_many :post_blogs, dependent: :destroy
  has_many :post_meals, dependent: :destroy

  has_many :workout_likes, dependent: :destroy
  has_many :workout_comments, dependent: :destroy

  has_many :meal_likes, dependent: :destroy
  has_many :meal_comments, dependent: :destroy

  has_many :blog_likes, dependent: :destroy
  has_many :blog_comments, dependent: :destroy

  # フォロー機能
  has_many :followers, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followeds, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

  has_many :following_end_users, through: :followers, source: :followed
  has_many :follower_end_users, through: :followeds, source: :follower

  has_many :notifications, dependent: :destroy

  has_many :weights, dependent: :destroy

  enum sex: { woman: 0, man: 1, neither: 2, no_answer: 3 }
  enum activelevel: { level1: 0, level2: 1, level3: 2 }

  validates :user_name, :email, presence: true

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |end_user|
      end_user.user_name = 'Guest User'
      end_user.password = SecureRandom.urlsafe_base64
    end
  end

  def guest_user?
    email == 'guest@example.com'
  end

  def active_for_authentication?
    super && (is_deleted == false)
  end

  # プロフィール画像の取得
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/noimage.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

  # ユーザーをフォローする
  def follow(end_user_id)
    followers.create(followed_id: end_user_id)
  end

  # ユーザーのフォローを外す
  def unfollow(end_user_id)
    followers.find_by(followed_id: end_user_id).destroy
  end

  # フォローしていればtrueを返す
  def following?(end_user)
    following_end_users.include?(end_user)
  end

  # 1日の総カロリー計算のリセット日を特定
  def last_reset_date
    latest_post_meal_start_time = post_meals.maximum(:start_time)
    latest_post_meal_start_time || Date.current
  end
end
