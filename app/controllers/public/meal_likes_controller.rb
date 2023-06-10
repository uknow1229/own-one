class Public::MealLikesController < ApplicationController
  def create
    post_meal = PostMeal.find(params[:post_meal_id])
    like = current_end_user.meal_likes.new(post_meal_id: post_meal.id)
    like.save
    redirect_to request.referer
  end

  def destroy
    post_meal = PostMeal.find(params[:post_meal_id])
    like = current_end_user.meal_likes.find_by(post_meal_id: post_meal.id)
    like.destroy
    redirect_to request.referer
  end
end
