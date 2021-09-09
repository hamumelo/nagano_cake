class Public::AddressesController < ApplicationController
  def index
     @address = Address.new
     @addresses = Address.page(params[:page]).reverse_order
  end

  def edit
     @address = Address.find(params[:id])
  end
  
  def create
     @address = Address.new(address_params)
     @address.save
    redirect_to admin_genres_path(@genre.id)
    # if @genre_post.save
    #   flash[:notice] = "genre was successfully created."
    # redirect_to admin_genres_path(@book_new.id)
    # else
    #   @genres = Genre.all
    #   render :index
    # end
  end

  def update
     @address = Address.find(params[:id])
     @address.update(address_params)
    redirect_to customers_my_page_path
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
    redirect_to books_path
  end

  private

  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end
  
end
