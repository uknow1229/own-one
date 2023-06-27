class Public::PostWorkoutsController < ApplicationController
  before_action :ensure_user, only: [:edit, :update, :destroy]

  def index
    @post_workouts = PostWorkout.all
    @tag_list = WorkoutTag.all
    @end_user = current_end_user
    # フォロー中のユーザーを取得するための関連名を適用
    @followed_end_users = @end_user.following_end_users
    # フォロー中のユーザーの投稿を取得
    @followed_post_workouts = PostWorkout.where(end_user_id: @followed_end_users.pluck(:id))
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
    5.times { @post_workout.workout_menus.build }
  end

  def create
    @post_workout = PostWorkout.new(post_workout_params)
    @post_workout.end_user_id = current_end_user.id
    tag_list = params[:post_workout][:name].split(',')
    if @post_workout.save
      @post_workout.save_workout_tags(tag_list)
      redirect_to post_workouts_path, notice:'投稿が完了しました'
    else
      flash[:notice] = "投稿を作成できませんでした"
      render :new
    end
  end
    
  def update
    @post_workout = PostWorkout.find(params[:id])
    tag_list=params[:post_workout][:name].split(',')
    if @post_workout.update(post_workout_params)
      @post_workout.save_workout_tags(tag_list)
      redirect_to post_workouts_path
      flash[:notice] = "更新が完了しました"
    else
      flash[:notice] = "フィットネス投稿を更新できませんでした"
      render :edit
    end
  end

  def destroy
    @post_workout = PostWorkout.find(params[:id])
    @post_workout.workout_menus.destroy_all
    @post_workout.destroy
    flash[:notice] = "削除が完了しました"
    redirect_to post_workouts_path
  end

  def search_tag
    @tag_list = WorkoutTag.all
    @tag = WorkoutTag.find(params[:workout_tag_id])
    @post_workouts = @tag.post_workouts
  end

  private

  def post_workout_params
    params.require(:post_workout).permit(:end_user_id, :image, :start_time, :title, :site, :time, :memo,
      workout_menus_attributes: [:id, :title, :weight, :reptition_count, :set_count, :_destroy])
  end

  def ensure_user
    @post_workouts = current_end_user.post_workouts
    @post_workout = @post_workouts.find_by(id: params[:id])
    redirect_to new_post_workout_path unless @post_workout
  end

end