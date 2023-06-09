class Public::WorkoutLikesController < ApplicationController
  def create
    post_workout = PostWorkout.find(params[:post_workout_id])
    like = current_end_user.workout_likes.new(post_workout_id: post_workout.id)
    like.save
    redirect_to request.referer
  end

  def destroy
    post_workout = PostWorkout.find(params[:post_workout_id])
    like = current_end_user.workout_likes.find_by(post_workout_id: post_workout.id)
    like.destroy
    redirect_to request.referer
  end
end
