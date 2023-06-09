class Public::PostMealsController < ApplicationController
  def index
    @post_meals = PostMeal.all
  end

  def new
    @post_meal = PostMeal.new
  end

  def create

  end

  def show
  end

  def edit
  end

  def update

  end

  def destroy

  end

  private


end
