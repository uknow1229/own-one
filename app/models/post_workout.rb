class PostWorkout < ApplicationRecord
  has_one_attached :image
  belongs_to :end_user

  has_many :workout_likes, dependent: :destroy
  has_many :liked_end_users, through: :workout_likes, source: :end_user

  has_many :workout_comments, dependent: :destroy
  has_many :workout_menus, dependent: :destroy

  has_many :post_workout_tags, dependent: :destroy
  has_many :workout_tags, through: :post_workout_tags

  has_one :notification, as: :subject, dependent: :destroy

  accepts_nested_attributes_for :workout_menus, allow_destroy: true, reject_if: :all_blank, limit: 5

  enum site: { shoulder: 0, arm: 1, chest: 2, back: 3, belly: 4, buttocks: 5, thigh: 6, calf: 7, the_upper_body: 8, lower_half_of_the_body: 9 }

  validates :start_time, :site, :time, presence: true
  validates :title, length: { maximum: 40 } , presence: true
  validates :memo, length: { maximum: 800 } , presence: true

  def liked_by?(end_user)
    workout_likes.exists?(end_user_id: end_user.id)
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "title"]
  end

  def save_workout_tags(tags)
    current_tags = self.workout_tags.pluck(:name) unless self.workout_tags.nil?
    old_tags = current_tags - tags
    new_tags = tags - current_tags

    # 古いタグを削除
    old_tags.each do |old_name|
      self.workout_tags.delete WorkoutTag.find_by(name:old_name)
    end

    # 新しいタグを作成
    new_tags.each do |new_name|
      workout_tag = WorkoutTag.find_or_create_by(name:new_name)
      self.workout_tags << workout_tag
    end
  end
end
