class Public::MealLikesController < ApplicationController
  def create
    @post_meal = PostMeal.find(params[:post_meal_id])
    like = current_end_user.meal_likes.new(post_meal_id: @post_meal.id)
    like.save
  end

  def destroy
    @post_meal = PostMeal.find(params[:post_meal_id])
    like = current_end_user.meal_likes.find_by(post_meal_id: @post_meal.id)
    like.destroy
  end
end
