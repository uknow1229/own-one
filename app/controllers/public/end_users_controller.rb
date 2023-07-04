class Public::EndUsersController < ApplicationController
  before_action :authenticate_end_user!
  before_action :is_matching_login_user, only: [:edit, :update]
  before_action :ensure_guest_user, only: [:edit]

  def show
    @end_user = EndUser.find(params[:id])
    @post_workouts = @end_user.post_workouts.with_attached_image.page(params[:page]).per(9)
    @post_blogs = @end_user.post_blogs.with_attached_image
    @post_meals = @end_user.post_meals.includes(:meal_menus).with_attached_image.page(params[:page]).per(9)
    @events = @post_workouts + @post_meals + @post_blogs

    @following_end_users = @end_user.following_end_users
    @follower_end_users = @end_user.follower_end_users
    
    # いいねした投稿を取得
    @liked_post_workouts = @end_user.workout_likes.includes(post_workout: :end_user).map(&:post_workout)
    @liked_post_meals = @end_user.meal_likes.includes(post_meal: :end_user).map(&:post_meal)
    @liked_post_blogs = @end_user.blog_likes.includes(post_blog: :end_user).map(&:post_blog)
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
    # 値がnilの場合、計算を中断
    return if any_value_nil?(end_user.height, end_user.body_weight, end_user.age, end_user.sex)

    bmr = calculate_bmr(end_user.height, end_user.body_weight, end_user.age, end_user.sex)
    activity_multiplier = determine_activity_multiplier(end_user.activelevel)
    (bmr * activity_multiplier).round(2)
  end

  def calculate_bmr(height, body_weight, age, sex)
    # 値がnilの場合、計算を中断
    return if any_value_nil?(height, body_weight, age, sex)

    # body_weightがnilの場合、デフォルト値として0.0を設定
    body_weight ||= 0.0  
    case sex.to_sym
    when :man
      bmr = 10 * body_weight.to_f + 6.25 * height - 5 * age + 5
    when :woman
      bmr = 10 * body_weight.to_f + 6.25 * height - 5 * age - 161
    else
      0.0
    end
  end

  def determine_activity_multiplier(activelevel)
    # 活動レベルに基づいて活動係数を返す
    case activelevel.to_sym
    when :level1
      1.2
    when :level2
      1.55
    when :level3
      1.9
    end
  end

  def any_value_nil?(*values)
    # 値のいずれかがnilかどうかを確認
    values.any?(&:nil?)
  end
end
