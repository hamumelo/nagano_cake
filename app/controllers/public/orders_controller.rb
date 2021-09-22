class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @addresses = Address.all
    @customer = current_customer
    
  #   @order.postal_code = current_customer.postal_code
  #   @order.address = current_customer.address
  #   @order.name = current_customer.last_name + current_customer.first_name
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = CartItem.all
    @order.shipping_cost = 800
    @total_price = 0
    @cart_items.each do |cartItem|
    @total_price += cartItem.subtotal
    @order_price = @order.shipping_cost + @total_price
    end
    # byebug
    # if request.post? then
    #   if params["select_address"] then
    #     @value = "ご自身の住所を選択しました。"
    #   elsif params["select_address"] then
    #     @value = "登録済住所を選択しました。"
    #     else
    #       @value = "新しいお届け先を選択しました。"
    #     end
    #   end
     if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
     elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
     else
     end
     
  end
  
  def complete
  end

  def create
     @order = Order.new(order_params)
     @order.save
    redirect_to complete_orders_path
    # if @order.save
    #   flash[:notice] = "order was successfully created."
    # redirect_to complete_orders_path
    # else
    # @order = Order.new(order_params)
    # @cart_items = CartItem.all
    # @order.shipping_cost = 800
    # @total_price = 0
    # @cart_items.each do |cartItem|
    # @total_price += cartItem.subtotal
    # @order_price = @order.shipping_cost + @total_price
    # end
    # if params[:order][:select_address] == "0"
    #   @order.postal_code = current_customer.postal_code
    #   @order.address = current_customer.address
    #   @order.name = current_customer.first_name + current_customer.last_name
    # elsif params[:order][:select_address] == "1"
    #   @address = Address.find(params[:order][:address_id])
    #   @order.postal_code = @address.postal_code
    #   @order.address = @address.address
    #   @order.name = @address.name
    # else
    # end
    #   render :confirm
    # end
  end

  def index
  end
  
  def show
  end

  private
  def order_params
      params.require(:order).permit(:customer_id, :payment_method, :postal_code, :address, :name, :shipping_cost, :total_payment)
  end
  
end