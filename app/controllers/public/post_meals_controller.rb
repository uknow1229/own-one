class Public::PostMealsController < ApplicationController
  def index
    @post_meals = PostMeal.all
  end

  def show
  end

  def edit
  end
end
