class ApplicationController < ActionController::Base
  # before_action :authenticate_admin!,except: [:top, :about, :new]
  # before_action :authenticate_customer!,except: [:top, :about, :new]
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_in_path_for(resource)
    case resource
    when Customer
      root_path
    when Admin
      admin_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :postal_code, :address, :telephone_number])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :encrypted_password])
    devise_parameter_sanitizer.permit(:account_update, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email])
  end
  
  
  
end
