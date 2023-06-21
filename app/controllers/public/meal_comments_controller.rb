class Public::MealCommentsController < ApplicationController
  def create
    @post_meal = PostMeal.find(params[:post_meal_id])
    @comment = current_end_user.meal_comments.new(meal_comment_params)
    @comment.post_meal_id = @post_meal.id
    @comment.save
  end

  def destroy
    @comment = MealComment.find(params[:id])
    @comment.destroy
    @post_meal = PostMeal.find(params[:post_meal_id])
  end

  private

  def meal_comment_params
    params.require(:meal_comment).permit(:comment)
  end
end
