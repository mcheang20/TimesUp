class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # before_action :authenticate_user!
  before_action :config_devise_params, if: :devise_controller?

  def after_sign_in_path_for(resource)
    user_path(current_user)
  end

  private

  def config_devise_params
    devise_parameter_sanitizer.for(:sign_up) << :username
    devise_parameter_sanitizer.for(:account_update) << :username
  end
end
