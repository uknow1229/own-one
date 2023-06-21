module Public::PostBlogsHelper
  def get_image(post_blog, width, height)
    if post_blog.image.attached?
      post_blog.image.variant(resize_to_limit: [width, height]).processed
    else
      'noimage.jpg'
    end
  end
end
