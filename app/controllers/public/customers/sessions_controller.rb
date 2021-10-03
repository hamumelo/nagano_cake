# frozen_string_literal: true

class Public::Customers::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]

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
  
  def reject_inactive_user
    @customer = Customer.find_by(name: params[:customer][:name])
    if @customer
      if @customer.active_password?(params[:customer][:password]) && !@customer.is_valid
        redirect_to new_user_session_path
      end
    end
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
