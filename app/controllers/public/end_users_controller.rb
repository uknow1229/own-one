class Public::EndUsersController < ApplicationController
  def show
    @end_user = EndUser.find(current_end_user.id)
  end

  def edit
  end

  def check
  end

  private

  def end_user_params
    params.require(:end_user).permit(:last_name, :first_name, :height, :body_weight, :age, :sex, :target_weight, :target_calorie, :activelevel, :introduction)
  end
end
