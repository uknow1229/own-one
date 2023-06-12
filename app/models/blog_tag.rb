class BlogTag < ApplicationRecord
  has_many :post_blog_tags, dependent: :destroy
  has_many :post_blogs, through: :post_blog_tags

  validates :name, presence:true, length:{maximum:50}
end
