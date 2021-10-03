class Admin::SessionsController < ApplicationController

  def new
    # @registrations = Registrations.new
  end

  def create
    # @registrations = Registrations.new(registration_params)
    # @registration.save
    # redirect_to admin_items_path(@item.id)
    # if @registration.save
    #   flash[:notice] = "genre was successfully created."
    # redirect_to admin_items_path(@item.id)
    # else
    # @registration = Registration.new
    # @genres = Genre.all
    # end
  end

  def destroy
    # @registrations = Registrations.new
  end

  private

  # def item_params
  #   params.require(:registration).permit(:image, :name, :introduction, :genre_id, :price, :is_active)
  # end
  
end
