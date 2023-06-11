class ApplicationController < ActionController::Base
  before_action :search

  def search
    @q = params[:q]

    @post_workout = PostWorkout.ransack(title_cont: @q).result
    @post_meal = PostMeal.ransack(memo_cont: @q).result


    # @result = params[:q]&.values&.reject(&:blank?)
  end

end
