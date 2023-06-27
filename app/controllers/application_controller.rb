class ApplicationController < ActionController::Base
  before_action :search
  before_action :authenticate_end_user!, except: [:top]
  before_action :configure_permitted_parameters, if: :devise_controller?

  # 検索機能
  def search
    @q = params[:q]
    @post_workout = PostWorkout.ransack(title_cont: @q).result
    @post_meal = PostMeal.ransack(memo_cont: @q).result
    @post_blog = PostBlog.ransack(title_cont: @q).result
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name])
  end

end
