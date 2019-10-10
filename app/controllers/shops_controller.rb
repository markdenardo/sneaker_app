class ShopsController < ApplicationController

def index
  @shops = Shop.all
end

def show
  @shop = Shop.find(params[:id])
end

def new
  @shop = Shop.new
end

def create
  @shop = Shop.create(params.require(:shop).permit(:user_id, :sneaker_id))
  if @shop.save
    redirect_to shops_path
  else
    render "new"
  end
end

def edit
  @shop = Shop.find(params[:id])
end

def update
  @shop = Shop.find(params[:id])
  @shop.update(params.require(:shop).permit(:user_id, :sneaker_id))
  redirect_to shop_path(@shop)
end

def destroy
  @shop = Shop.find(params[:id])
  @shop.destroy
  redirect_to shops_path
end


end
