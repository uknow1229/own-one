class Public::WeightsController < ApplicationController
  def index
    @weights = Weight.all
    @weight = Weight.new
    @target_weight = current_end_user.target_weight

    selected_month = params[:month] ? Date.strptime(params[:month], '%Y-%m') : Date.today
    end_of_selected_month = selected_month.end_of_month
    start_of_selected_month = end_of_selected_month.beginning_of_month
  
    @monthly_weights = current_end_user.weights.where(start_time: start_of_selected_month..end_of_selected_month).order(start_time: :asc)
    date_range = (start_of_selected_month..end_of_selected_month).map { |date| date.strftime("%Y-%m-%d") }
  
    weights_data = @monthly_weights.map { |w| { x: w.start_time.strftime("%Y-%m-%d"), y: w.value } }
    @weights_data = date_range.map do |date|
      weights_data.find { |data| data[:x] == date } || { x: date, y: 0 }
    end
    respond_to do |format|
      format.html
      format.js
    end
  end


  def show
    @weights = Weight.all
    @weight = Weight.find(params[:id])
  end

  def edit
    @weight = Weight.find(params[:id])
  end

  def update
    @weight = Weight.find(params[:id])
    if @weight.update(weight_params) 
      redirect_to weights_path, notice: '更新に成功しました'
    else
      render :edit
    end
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
      render :index
    end

  end

  def destroy

  end

  private

  def weight_params
    params.require(:weight).permit(:value, :start_time)
  end
end
