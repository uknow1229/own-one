class BlogLike < ApplicationRecord
  belongs_to :end_user
  belongs_to :post_blog

  validates :end_user_id, uniqueness: { scope: :post_blog_id }
end
