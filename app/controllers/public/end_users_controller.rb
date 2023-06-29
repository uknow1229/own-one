class Public::EndUsersController < ApplicationController
  before_action :authenticate_end_user!
  before_action :is_matching_login_user, only: [:edit, :update]
  before_action :ensure_guest_user, only: [:edit]

  def show
    @end_user = EndUser.find(params[:id])
    @post_workouts = @end_user.post_workouts
    @post_blogs = @end_user.post_blogs
    @post_meals = @end_user.post_meals
    @events = @post_workouts + @post_meals + @post_blogs
    
    @following_end_users = @end_user.following_end_users
    @follower_end_users = @end_user.follower_end_users
    
    # いいねした投稿を取得
    @liked_post_workouts = @end_user.workout_likes.includes(:post_workout).map(&:post_workout)
    @liked_post_meals = @end_user.meal_likes.includes(:post_meal).map(&:post_meal)
    @liked_post_blogs = @end_user.blog_likes.includes(:post_blog).map(&:post_blog)
  end

  def edit
    @end_user = EndUser.find(current_end_user.id)
  end

  def profile
    @end_user = EndUser.find(current_end_user.id)
    @calories = calculate_daily_calories(@end_user)
  end

  def update
    @end_user = EndUser.find(params[:id])
    if @end_user.update(end_user_params)
      redirect_to profile_end_user_path
      flash[:notice] = "更新が完了しました"
    else
      flash[:notice] = "ユーザー情報を更新できませんでした"
      render :edit
    end
  end

  def check
  end

  def withdraw
    @end_user = current_end_user
    if @end_user.email == 'guest@example.com'
      redirect_to root_path
      flash[:notice] = "ゲストユーザーは退会できません"
    else
      @end_user.update(is_deleted: true)
      reset_session
      flash[:notice] = "退会処理を実行いたしました"
      redirect_to root_path
    end
  end

  def blog_likes
    @post_blog = PostBlog.find(params[:id])
  end

  def meal_likes
    @post_meal = PostMeal.find(params[:id])
  end

  def workout_likes
    @post_workout = PostWorkout.find(params[:id])
  end

  def followeds
    @end_user = EndUser.find(params[:id])
    @end_users = @end_user.following_end_users
  end

  def followers
    @end_user = EndUser.find(params[:id])
    @end_users = @end_user.follower_end_users
  end

  private

  def end_user_params
    params.require(:end_user).permit(:user_name, :height, :body_weight, :age, :sex, :target_weight, :target_calorie, :activelevel, :introduction, :email, :profile_image)
  end

  def ensure_guest_user
    @end_user = EndUser.find(params[:id])
    if @end_user.guest_user?
      redirect_to end_user_path(current_end_user) , notice: "ゲストユーザーはプロフィール編集画面へ遷移できません"
    end
  end

  def is_matching_login_user
    end_user = EndUser.find(params[:id])
    unless end_user.id == current_end_user.id
      redirect_to root_path
    end
  end

  # 適正カロリー計算
  def calculate_daily_calories(end_user)
    bmr = calculate_bmr(end_user.height, end_user.body_weight, end_user.age, end_user.sex)
    activity_multiplier = determine_activity_multiplier(end_user.activelevel)
    daily_calories = bmr * activity_multiplier
    # 小数点以下の桁数を調整
    daily_calories.round(2) 
  end

  def calculate_bmr(height, body_weight, age, sex)
    case sex.to_sym
    when :man
      bmr = 10 * body_weight + 6.25 * height - 5 * age + 5
    when :woman
      bmr = 10 * body_weight + 6.25 * height - 5 * age - 161
    else
      bmr
    end
    bmr
  end

  def determine_activity_multiplier(activelevel)
    case activelevel.to_sym
    when :level1
      multiplier = 1.2
    when :level2
      multiplier = 1.55
    when :level3
      multiplier = 1.9
    end
    multiplier 
  end
end
