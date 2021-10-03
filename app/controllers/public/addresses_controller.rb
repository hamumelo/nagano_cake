class Public::AddressesController < ApplicationController
  def index
     @address = Address.new
     @addresses = Address.all
  end
  
  def create
     @address = Address.new(address_params)
    if @address.save
      flash[:notice] = "配送先を登録しました"
    redirect_to addresses_path
    else
     @addresses = Address.all
      render :index
    end
  end

  def edit
     @address = Address.find(params[:id])
  end

  def update
     @address = Address.find(params[:id])
    if @address.update(address_params)
      flash[:notice] = "配送先を変更しました"
    redirect_to addresses_path
    else
      render :edit
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
      flash[:notice] = "配送先を削除しました"
    redirect_to addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end
  
end
