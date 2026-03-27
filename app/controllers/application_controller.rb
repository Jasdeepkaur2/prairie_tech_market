class ApplicationController < ActionController::Base
  allow_browser versions: :modern
  before_action :configure_permitted_parameters, if: :devise_controller?

  def authenticate_admin_user!
    redirect_to root_path, alert: "Not authorized." unless current_user&.admin?
  end

  def current_admin_user
    current_user if current_user&.admin?
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone, :address, :city, :postal_code, :province_id])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone, :address, :city, :postal_code, :province_id])
  end
end
