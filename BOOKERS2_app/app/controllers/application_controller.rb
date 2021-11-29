class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  # サインイン後のリダイレクト先をマイページへ
  def after_sign_in_path_for(resource)
    flash[:notice] = "ログインに成功しました"
    user_path(current_user.id)
  end
  
   # サインアウト後のリダイレクト先をトップページへ
  def after_sign_out_path_for(resource)
    flash[:alert] = "ログアウトしました"
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
