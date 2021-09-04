class Admin::CustomersController < ApplicationController
  def index
     @customers = Customer.page(params[:page]).reverse_order
  end
  
  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
  end

  def edit
  end

  def update
  end
end
