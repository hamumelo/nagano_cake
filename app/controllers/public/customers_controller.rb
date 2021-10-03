class Public::CustomersController < ApplicationController
  def index
  end
  
  def show
     @customer = current_customer
     @orders = Order.all
  end

  def edit
     @customer = current_customer
  end

  def unsubscribe
     @customer = current_customer
  end
  
  def withdraw
    @customer = current_customer
    # @customer = Customer.find_by(name: params[:name])
    @customer.update(is_active: false)
    reset_session
    redirect_to root_path
  end

  def update
     @customer = current_customer
    if @customer.update(customer_params)
      flash[:notice] = "会員情報を変更しました"
    redirect_to customers_my_page_path
    else
     @customer = current_customer
      render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number)
  end
  
end

