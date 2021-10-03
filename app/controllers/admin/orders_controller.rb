class Admin::OrdersController < ApplicationController
  def show
    @customer = current_customer
    @order = Order.find(params[:id])
    @order_details = @order.order_details.page(params[:page]).reverse_order
    @orders = Order.all
    @order.shipping_cost = 800
    @total_price = 0
    @orders.each do |order|
    @total_price = @order.total_payment - @order.shipping_cost
  end
  end
  
  def update
     @order = Order.find(params[:id])
     @order.update(order_params)
    redirect_to admin_order_path(@order.id)
    # if @genre_post.update
    #   flash[:notice] = "You have updated genre successfully."
    # redirect_to admin_genres_path(@book_new.id)
    # else
    #   render :edit
    # end
  end

  private
  def order_params
      params.require(:order).permit(:status)
  end
  def order_detail_params
      params.require(:order_detail).permit(:making_status)
  end
  
end
