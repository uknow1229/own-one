module Public::PostWorkoutsHelper
  def get_image(post_workout, width, height)
    if post_workout.image.attached?
      post_workout.image.variant(resize_to_limit: [width, height]).processed
    else
      'noimage.jpg'
    end
  end
end


