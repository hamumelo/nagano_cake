class Public::AddressesController < ApplicationController
  def index
     @address = Address.new
     @addresses = Address.all
  end
  
  def create
     @address = Address.new(address_params)
     @address.save
    redirect_to addresses_path(@address.id)
    # if @genre_post.save
    #   flash[:notice] = "genre was successfully created."
    # redirect_to admin_genres_path(@book_new.id)
    # else
    #   @genres = Genre.all
    #   render :index
    # end
  end

  def edit
     @address = Address.find(params[:id])
  end

  def update
     @address = Address.find(params[:id])
     @address.update(address_params)
    redirect_to addresses_path
    # if @item.update(item_params)
    #   flash[:notice] = "You have updated genre successfully."
    # redirect_to admin_item_path(@item.id)
    # else
    #   render :edit
    # end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end
  
end
