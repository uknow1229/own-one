class Public::WeightsController < ApplicationController
  def index
    @weights = Weight.all
    @weight = Weight.new
    end_of_month = Date.today.end_of_month
    start_of_month = end_of_month.beginning_of_month
    @new_weights = current_end_user.weights.where(date: start_of_month..end_of_month).order(date: :asc)
    @weights_data = @new_weights.map {|w| {x: w.date.strftime("%Y-%m-%d"), y: w.value}}
  end

  def show
    @weights = Weight.all
    # @weight = Weight.find(params[:id])
  end

  def edit
    @weight = Weight.find(params[:id])
  end

  def new
    @weight = Weight.new
  end

  def create
    @weight = Weight.new(weight_params)
    @weight.end_user_id = current_end_user.id

    if @weight.save
      redirect_to weights_path, notice: '登録に成功しました'
    else
      render :new
    end

  end

  def destroy

  end

  private

  def weight_params
    params.require(:weight).permit(:value, :date)
  end
end
