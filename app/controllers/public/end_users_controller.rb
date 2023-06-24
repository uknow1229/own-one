class Public::EndUsersController < ApplicationController

  def show
    @end_user = EndUser.find(current_end_user.id)
    @post_workouts = @end_user.post_workouts.page(params[:page]).per(3)
    @post_blogs = @end_user.post_blogs.page(params[:page]).per(3)
    @post_meals = @end_user.post_meals.page(params[:page]).per(3)
    @events = @post_workouts + @post_meals + @post_blogs
    
    @following_end_users = @end_user.following_end_users
    @follower_end_users = @end_user.follower_end_users
  end

  def edit
    @end_user = EndUser.find(current_end_user.id)
  end

  def profile
    @end_user = EndUser.find(current_end_user.id)
    @post_workouts = @end_user.post_workouts
  end

  def update
    @end_user = EndUser.find(params[:id])
    if @end_user.update(end_user_params)
    redirect_to end_user_path
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
end
