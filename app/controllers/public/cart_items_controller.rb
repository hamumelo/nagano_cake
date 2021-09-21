class Public::CartItemsController < ApplicationController
  def index
    # @cart_item = Item.find(params[:item_id])
    @cart_items = current_customer.cart_items
    @cart_items = CartItem.page(params[:page]).reverse_order
    @customer = current_customer
    @total_price = 0
    @cart_items.each do |cartItem|
    @total_price += cartItem.subtotal
  end
  end
  
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    if cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
        cart_item.amount += params[:cart_item][:amount].to_i
        cart_item.save
        # flash[:notice] = "Item was successfully added to cart."
        redirect_to cart_items_path
    # elsif @cart_item.save
    #   flash[:notice] = "You have created cart_item successfully."
    # redirect_to cart_items_path
    else @cart_item.save
    redirect_to cart_items_path
    # else
    #   render 'public/items/show'
    end
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
   
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end
   
  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  private
  
  def cart_item_params
      params.require(:cart_item).permit(:customer_id, :item_id, :amount)
  end
  
end
