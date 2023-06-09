class Public::PostWorkoutsController < ApplicationController
  def index
    @post_workouts = PostWorkout.all
  end

  def show
    @post_workouts = PostWorkout.all
    @post_workout = PostWorkout.find(params[:id])
    @workout_comment = WorkoutComment.new
  end

  def edit
    @post_workout = PostWorkout.find(params[:id])
  end

  def new
    @post_workout = PostWorkout.new
  end

  def create
    @post_workout = PostWorkout.new(post_workout_params)
    @post_workout.end_user_id = current_end_user.id
    if @post_workout.save
      redirect_to post_workouts_path
    else
      render :new
    end
  end
    
  def update
    @post_workout = PostWorkout.find(params[:id])
    if @post_workout.update(post_workout_params)
      redirect_to post_workouts_path
    else
      render :edit
    end
  end

  def destroy
    @post_workout = PostWorkout.find(params[:id])
    @post_workout.destroy
    redirect_to post_workouts_path
    flash[:notice] = "削除が完了しました"
  end

  private

  def post_workout_params
    params.require(:post_workout).permit(:end_user_id, :image, :date, :title, :site, :time, :memo)
  end

end
