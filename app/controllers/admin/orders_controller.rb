class Admin::OrdersController < ApplicationController
  def show
    @admin_order = Admin_order.find(params[:id])
  end
  
  def update
  end
  
end
