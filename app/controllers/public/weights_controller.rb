class Public::WeightsController < ApplicationController
  def index
    @weights = Weight.all
  end

  def show
    @weights = Weight.all
    @weight = Weight.find(params[:id])
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
      redirect_to weight_path(@weight), notice: '登録に成功しました'
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
