class PostBlogTag < ApplicationRecord
  belongs_to :post_blog
  belongs_to :blog_tag

  validates :post_blog_id, presence: true
  validates :blog_tag_id, presence: true
end
