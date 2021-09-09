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

  def update
     @customer = current_customer
     @customer.update(customer_params)
    redirect_to customers_my_page_path
    # if @item.update(item_params)
    #   flash[:notice] = "You have updated genre successfully."
    # redirect_to admin_item_path(@item.id)
    # else
    #   render :edit
    # end
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number)
  end
  
end

