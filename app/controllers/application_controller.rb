class ApplicationController < ActionController::Base
  before_action :search

  def search
    @q = PostWorkout.ransack(params[:q])
    @post_workout = @q.result
    @result = params[:q]&.values&.reject(&:blank?)
  end

end
