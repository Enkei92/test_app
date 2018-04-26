class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?  
  protect_from_forgery with: :exception
  alias_method :current_user, :current_account

  def after_sign_in_path_for(resource)
  	if current_account.vendor?
      if current_account.vendor.present?
        current_account.vendor
      else
        new_vendor_path
      end
    elsif current_account.customer?
      if current_account.vendor.present?
        current_account.customer
      else  
        new_customer_path
      end
    else
      root_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :role])
  end
end
