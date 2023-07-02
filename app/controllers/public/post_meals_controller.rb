class Public::PostMealsController < ApplicationController
  before_action :ensure_user, only: [:edit, :update, :destroy]

  def index
    @post_meals = PostMeal.with_attached_image.includes(:image_attachment, :end_user).all
    @tag_list = MealTag.all
    @end_user = current_end_user
    # フォロー中のユーザーを取得するための関連名を適用
    @followed_end_users = @end_user.following_end_users
    # フォロー中のユーザーの投稿を取得
    @followed_post_meals = PostMeal.where(end_user_id: @followed_end_users.pluck(:id))
  end

  def show
    @post_meal = PostMeal.includes(:end_user, :meal_tags).find(params[:id])
    @meal_comment = MealComment.new
    @meal_comments = @post_meal.meal_comments.includes(:end_user)
    @tag_list = @post_meal.meal_tags.pluck(:name).join(',')
    @post_meal_tags = @post_meal.meal_tags
    @end_user = @post_meal.end_user
  end

  def new
    @post_meal = PostMeal.new
    5.times { @post_meal.meal_menus.build }
  end

  def create
    @post_meal = PostMeal.new(post_meal_params)
    @post_meal.end_user_id = current_end_user.id
    tag_list = params[:post_meal][:name].split(',')
    if @post_meal.save
      @post_meal.save_meal_tags(tag_list)
      redirect_to post_meals_path, notice:"投稿が完了しました"
    else
      flash[:alert] = "投稿を作成できませんでした"
      render :new
    end
  end

  def edit
    @post_meal = PostMeal.find(params[:id])
    @tag_list = @post_meal.meal_tags.pluck(:name).join(',')
  end

  def update
    @post_meal = PostMeal.find(params[:id])
    tag_list=params[:post_meal][:name].split(',')
    if @post_meal.update(post_meal_params)
      @post_meal.save_meal_tags(tag_list)
      redirect_to post_meals_path
      flash[:notice] = "更新が完了しました"
    else
      flash[:alert] = "食事投稿を更新できませんでした"
      render :edit
    end
  end

  def destroy
    @post_meal = PostMeal.find(params[:id])
    @post_meal.meal_menus.destroy_all
    @post_meal.destroy
    redirect_to post_meals_path
    flash[:notice] = "削除が完了しました"
  end

  def search_tag
    @tag_list = MealTag.includes(:end_user)
    @tag = MealTag.find(params[:meal_tag_id])
    @post_meals = @tag.post_meals
  end

  private

  def post_meal_params
    params.require(:post_meal).permit(:end_user_id, :image, :start_time, :timing, :meal_type, :memo,
      meal_menus_attributes: [:id, :title, :quantity, :calorie, :_destroy])
  end

  def ensure_user
    @post_meals = current_end_user.post_meals
    @post_meal = @post_meals.find_by(id: params[:id])
    redirect_to new_post_meal_path unless @post_meal
  end

end
