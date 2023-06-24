class ApplicationController < ActionController::Base
  before_action :search
  before_action :configure_permitted_parameters, if: :devise_controller?

  def search
    @q = params[:q]

    @post_workout = PostWorkout.ransack(title_cont: @q).result
    @post_meal = PostMeal.ransack(memo_cont: @q).result
    @post_blog = PostBlog.ransack(title_cont: @q).result

    # @result = params[:q]&.values&.reject(&:blank?)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name])
  end

end
