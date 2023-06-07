class Public::EndUsersController < ApplicationController
  def show
    @end_user = EndUser.find(current_end_user.id)
  end

  def edit
  end

  def check
  end

  def withdraw
    @end_user = EndUser.find(current_end_user.id)
    @end_user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  private

  def end_user_params
    params.require(:end_user).permit(:last_name, :first_name, :height, :body_weight, :age, :sex, :target_weight, :target_calorie, :activelevel, :introduction)
  end
end
