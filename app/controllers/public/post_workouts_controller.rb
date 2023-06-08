class Public::PostWorkoutsController < ApplicationController
  def index
    @post_workouts = PostWorkout.all
  end

  def show
    @post_workouts = PostWorkout.all
    @post_workout = PostWorkout.find(params[:id])
  end

  def edit
  end
end
