class Admin::OrderDetailsController < ApplicationController
  
  def update
     @order = Order.find(params[:id])
     @order_detail = OrderDetail.find(params[:id])
     @order_detail.update(order_detail_params)
    redirect_to admin_path
    # if @genre_post.update
    #   flash[:notice] = "You have updated genre successfully."
    # redirect_to admin_genres_path(@book_new.id)
    # else
    #   render :edit
    # end
  end

  private
  def order_detail_params
      params.require(:order_detail).permit(:order_id, :item_id, :price, :amount, :making_status)
  end
end
