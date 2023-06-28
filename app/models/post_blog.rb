class PostBlog < ApplicationRecord
  has_one_attached :image
  belongs_to :end_user

  has_many :blog_likes, dependent: :destroy
  has_many :liked_end_users, through: :blog_likes, source: :end_user

  has_many :blog_comments, dependent: :destroy

  has_many :post_blog_tags, dependent: :destroy
  has_many :blog_tags, through: :post_blog_tags

  has_one :notification, as: :subject, dependent: :destroy

  validates :start_time, presence: true
  validates :title, length: { maximum: 40 } , presence: true
  validates :content, length: { maximum: 2800 } , presence: true

  def liked_by?(end_user)
    blog_likes.exists?(end_user_id: end_user.id)
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "title"]
  end

  def save_blog_tags(tags)
    current_tags = self.blog_tags.pluck(:name) unless self.blog_tags.nil?
    old_tags = current_tags - tags
    new_tags = tags - current_tags

    # 古いタグを削除
    old_tags.each do |old_name|
      self.blog_tags.delete BlogTag.find_by(name:old_name)
    end

    # 新しいタグを作成
    new_tags.each do |new_name|
      blog_tag = BlogTag.find_or_create_by(name:new_name)
      self.blog_tags << blog_tag
    end
  end
end
