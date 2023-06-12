class Public::PostMealsController < ApplicationController
  def index
    @post_meals = PostMeal.all

  end

  def new
    @post_meal = PostMeal.new
  end

  def create
    @post_meal = PostMeal.new(post_meal_params)
    @post_meal.end_user_id = current_end_user.id
    tag_list = params[:post_meal][:name].split(',')
    if @post_meal.save
      @post_meal.save_meal_tags(tag_list)
      redirect_to post_meals_path, notice:'投稿が完了しました'
    else
      render :new
    end
  end

  def show
    @post_meals = PostMeal.all
    @post_meal = PostMeal.find(params[:id])
    @meal_comment = MealComment.new
  end

  def edit
    @post_meal = PostMeal.find(params[:id])
  end

  def update
    @post_meal = PostMeal.find(params[:id])
    if @post_meal.update(post_meal_params)
      redirect_to post_meals_path
    else
      render :edit
    end
  end

  def destroy
    @post_meal = PostMeal.find(params[:id])
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
    params.require(:post_meal).permit(:end_user_id, :image, :date, :timing, :meal_type, :memo)
  end

end
