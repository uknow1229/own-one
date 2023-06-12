class PostBlogTag < ApplicationRecord
  belongs_to :post_blog
  belongs_to :blog_tag
end
