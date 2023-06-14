module Public::NotificationsHelper
  def transition_path(notification)
    case notification.action_type.to_sym
    when :commented_to_workout_post
      post_workout_path(notification.subject.post_workout, anchor: "comment-#{notification.subject.id}")
    when :liked_to_workout_post
      post_workout_path(notification.subject.post_workout)
    when :commented_to_meal_post
      post_meal_path(notification.subject.post_meal, anchor: "comment-#{notification.subject.id}")
    when :liked_to_meal_post
      post_meal_path(notification.subject.post_meal)
    when :followed_me
      end_user_path(notification.subject.follower)
    end
  end
end