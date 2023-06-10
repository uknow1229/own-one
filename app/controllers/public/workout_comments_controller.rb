class Public::WorkoutCommentsController < ApplicationController
  def create
    @post_workout = PostWorkout.find(params[:post_workout_id])
    @comment = current_end_user.workout_comments.new(workout_comment_params)
    @comment.post_workout_id = @post_workout.id
    @comment.save
  end

  def destroy
    @comment = WorkoutComment.find(params[:id])
    @comment.destroy
    @post_workout = PostWorkout.find(params[:post_workout_id])
  end

  private

  def workout_comment_params
    params.require(:workout_comment).permit(:comment)
  end
end
