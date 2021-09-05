class Admin::OrdersController < ApplicationController
  def show
    @order_details = Order_detail.page(params[:page]).reverse_order
    @order = Order.find(params[:id])
  end
  
  def update
     @gorder = Order.find(order_params[:id])
     @genre.update(order_params)
    render admin_order_path(@order.id)
    # if @genre_post.update
    #   flash[:notice] = "You have updated genre successfully."
    # redirect_to admin_genres_path(@book_new.id)
    # else
    #   render :edit
    # end
  end
  
end
