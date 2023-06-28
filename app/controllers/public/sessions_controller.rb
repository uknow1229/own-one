# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params,  if: :devise_controller?
  before_action :reject_end_user, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  def guest_sign_in
    end_user = EndUser.guest
    sign_in end_user
    redirect_to root_path, notice: "ゲストユーザーとしてログインしました"
  end
  
  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  protected
  
  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:body_weight, :age, :sex, :target_weight, :target_calorie, :activelevel, :introduction])
  end

  def reject_end_user
    @end_user = EndUser.find_by(email: params[:end_user][:email])
    if @end_user
      if @end_user.valid_password?(params[:end_user][:password]) && (@end_user.is_deleted == true)
        flash[:alert] = "退会済みです。再度ご登録をしてご利用ください"
        redirect_to new_end_user_registration_path
      else
        flash[:alert] = "項目を入力してください"
      end
    else
      flash[:alert] = "該当するユーザーが見つかりません"
    end
  end
end
