class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :password_confirmation])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :remember_me])
  end

  include PublicActivity::StoreController
end
