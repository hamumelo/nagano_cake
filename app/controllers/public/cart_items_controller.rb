class Public::CartItemsController < ApplicationController
  def index
    @items = Item.page(params[:page]).reverse_order
    @cartItems = Cart_item.all
    @item = Item.find(params[:id])
  end
  
  def create
    # binding.pry
    @item = Item.find(cart_item_params[:item_id])
    @cartItem = Item.new(cart_item_params)
    @cartItem.save
    redirect_to cart_items_path
    #   flash[:notice] = "You have updated genre successfully."
    # redirect_to admin_item_path(@item.id)
    # else
    #   render :edit
    # end
  end

   def update
    @cart_item.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
    #   flash[:notice] = "You have updated genre successfully."
    # redirect_to admin_item_path(@item.id)
    # else
    #   render :edit
    # end
   end

  private

  def cart_item_params
    params.require(:cart_item).permit(:customer_id, :item_id, :amount)
  end
  
end
