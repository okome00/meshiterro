class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # サインイン後aboutページへ遷移する設定（devise用メソッド）
  def after_sign_in_path_for(resource)
    post_images_path
  end

  # サインアウト後aboutページへ遷移する設定（devise用メソッド）
  def after_sign_out_path_for(resource)
    about_path
  end

  protected

  # ストロングパラメータ：ユーザー登録（sign_up）の際、ユーザー名（name）のデータ操作を許可
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
