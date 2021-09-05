class Public::CustomersController < ApplicationController
  def index
  end
  
  def show
     @customer = current_customer
     @orders = Order.all
  end

  def edit
  end

  def update
  end
end

