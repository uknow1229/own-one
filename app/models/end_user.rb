class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  has_one_attached :image
  has_many :post_workouts, dependent: :destroy

  has_many :workout_likes, dependent: :destroy
  has_many :workout_comments, dependent: :destroy

  has_many :meal_likes, dependent: :destroy
  has_many :meal_comments, dependent: :destroy
  has_many :blog_likes, dependent: :destroy
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
end
