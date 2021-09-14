class Public::OrdersController < ApplicationController
  def new
     @order = Order.new
  end

  def confilm
  end
  
  def complete
  end

  def create
  end

  def index
  end
  
  def show
    render "public/orders/complete"
  end

end