module Public::PostMealsHelper
  def get_image(post_meal, width, height)
    if post_meal.image.attached?
      post_meal.image.variant(resize_to_limit: [width, height]).processed
    else
      'noimage.jpg'
    end
  end
end
