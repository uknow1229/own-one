class Public::HomesController < ApplicationController
  def top
    @post_workouts = PostWorkout.all
  end

  def about
  end
end
