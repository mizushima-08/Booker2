class ApplicationController < ActionController::Base
  before_action :authenticate_user!,except: [:top, :about]
  #(ログインユーザー以外の情報を遷移しようとした時に制限をかける)
  before_action :ensure_current_user, {only: [:edit,:update]}
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  # サインイン後のリダイレクト先をマイページへ
  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end
  
  # サインアップ後のリダイレクト先をマイページへ
  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end
  
   # サインアウト後のリダイレクト先をトップページへ
  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
