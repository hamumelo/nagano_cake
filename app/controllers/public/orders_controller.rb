class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @addresses = Address.all
    @customer = current_customer
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = CartItem.all
    @order.shipping_cost = 800
    @total_price = 0
    @cart_items.each do |cartItem|
    @total_price += cartItem.subtotal
    @order.total_payment = @order.shipping_cost + @total_price
    end
     if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
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
    cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)
   if @order.save
    cart_items.each do |cartItem|
      order_detail = OrderDetail.new
      order_detail.item_id = cartItem.item_id
      order_detail.order_id = @order.id
      order_detail.amount = cartItem.amount
      order_detail.price = cartItem.item.price
      order_detail.save
   end
     current_customer.cart_items.destroy_all
    redirect_to  complete_orders_path
   else
    @order = Order.new(order_params)
    render :confirm
   end
  end

  def index
    @orders = Order.page(params[:page]).reverse_order
  end
  
  def show
    @order = Order.find(params[:id])
    @orders = Order.all
    @order.shipping_cost = 800
    @total_price = 0
    @orders.each do |order|
    @total_price = @order.total_payment - @order.shipping_cost
  end
  end

  private
  def order_params
      params.require(:order).permit(:customer_id, :payment_method, :postal_code, :address, :name, :shipping_cost, :total_payment, :created_at)
  end

  def address_params
    params.require(:order).permit(:name, :address)
  end
  
end