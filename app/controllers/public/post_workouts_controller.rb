class Public::PostWorkoutsController < ApplicationController
  def index
    @post_workouts = PostWorkout.all
    @tag_list = WorkoutTag.all
  end

  def show
    @post_workouts = PostWorkout.all
    @post_workout = PostWorkout.find(params[:id])
    @workout_comment = WorkoutComment.new
    @tag_list = @post_workout.workout_tags.pluck(:name).join(',')
    @post_workout_tags = @post_workout.workout_tags
    @end_user = @post_workout.end_user
  end

  def edit
    @post_workout = PostWorkout.find(params[:id])
    @tag_list = @post_workout.workout_tags.pluck(:name).join(',')
  end

  def new
    @post_workout = PostWorkout.new
  end

  def create
    @post_workout = PostWorkout.new(post_workout_params)
    @post_workout.end_user_id = current_end_user.id
    tag_list = params[:post_workout][:name].split(',')
    if @post_workout.save
      @post_workout.save_workout_tags(tag_list)
      redirect_to post_workouts_path, notice:'投稿が完了しました'
    else
      render :new
    end
  end
    
  def update
    @post_workout = PostWorkout.find(params[:id])
    tag_list=params[:post_workout][:name].split(',')
    if @post_workout.update(post_workout_params)
      @post_workout.save_workout_tags(tag_list)
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

  def search_tag
    @tag_list = WorkoutTag.all
    @tag = WorkoutTag.find(params[:workout_tag_id])
    @post_workouts = @tag.post_workouts
  end

  private

  def post_workout_params
    params.require(:post_workout).permit(:end_user_id, :image, :date, :title, :site, :time, :memo)
  end

end
