class Public::PostMealsController < ApplicationController
  def index
    @post_meals = PostMeal.all.page(params[:page]).per(9)
    @tag_list = MealTag.all
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
      redirect_to post_meals_path, notice:'投稿が完了しました'
    else
      flash[:notice] = "投稿を作成できませんでした"
      render :new
    end
  end

  def show
    @post_meals = PostMeal.all
    @post_meal = PostMeal.find(params[:id])
    @meal_comment = MealComment.new
    @tag_list = @post_meal.meal_tags.pluck(:name).join(',')
    @post_meal_tags = @post_meal.meal_tags
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
      flash[:notice] = "食事投稿を更新できませんでした"
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
    @tag_list = MealTag.all
    @tag = MealTag.find(params[:meal_tag_id])
    @post_meals = @tag.post_meals
  end

  private

  def post_meal_params
    params.require(:post_meal).permit(:end_user_id, :image, :start_time, :timing, :meal_type, :memo,
      meal_menus_attributes: [:id, :title, :quantity, :calorie, :_destroy])
  end
end
