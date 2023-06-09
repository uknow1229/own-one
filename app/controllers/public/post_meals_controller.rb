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
    if @post_meal.save
      redirect_to post_meals_path
    else
      render :new
    end
  end

  def show
    @post_meals = PostMeal.all
    @post_meal = PostMeal.find(params[:id])
  end

  def edit
  end

  def update

  end

  def destroy

  end

  private

  def post_meal_params
    params.require(:post_meal).permit(:end_user_id, :image, :date, :timing, :meal_type, :memo)
  end

end
