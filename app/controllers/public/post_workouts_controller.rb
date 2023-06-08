class Public::PostWorkoutsController < ApplicationController
  def index
    @post_workouts = PostWorkout.all
  end

  def show
  end

  def edit
  end
end
