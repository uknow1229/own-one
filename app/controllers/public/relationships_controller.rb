class Public::RelationshipsController < ApplicationController
  def create
    current_end_user.follow(params[:end_user_id])
    redirect_to request.referer
  end

  def destroy
    current_end_user.unfollow(params[:end_user_id])
    redirect_to request.referer
  end
end
