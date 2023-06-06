class BlogComment < ApplicationRecord
  belongs_to :end_user, dependent: :destroy
  belongs_to :post_blog, dependent: :destroy
end
