class Public::RegistrationsController < ApplicationController

  def new
     @customer = Customer.new
  end

  def create
     @customer = Customer.new(customer_params)
     @customer.save
    redirect_to admin_items_path(@item.id)
    # if @registration.save
    #   flash[:notice] = "genre was successfully created."
    # redirect_to admin_items_path(@item.id)
    # else
    # @registration = Registration.new
    # @genres = Genre.all
    # end
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :postal_code, :address, :telephone_number, :is_active)
  end
  
end
