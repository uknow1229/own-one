class Public::HomesController < ApplicationController
  def top
    @post_workouts = PostWorkout.all
    @post_meals = PostMeal.all
    @post_blogs = PostBlog.all
  end

  def about
  end
end
