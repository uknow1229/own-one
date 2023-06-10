class BlogComment < ApplicationRecord
  belongs_to :end_user
  belongs_to :post_blog
end
