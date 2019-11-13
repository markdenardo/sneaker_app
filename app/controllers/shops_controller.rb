class ShopsController < ApplicationController

    def index
      @shops = Shop.all
    end

    def show
      @shop =   Shop.find(params[:id])
    end

    def new
      @shop = Shop.new
    end

    def create
      @shop = Shop.create(check_params)
      if @shop.save
        redirect_to shops_path(@shop)
      else
        render "new"
      end
    end

    def edit
      
    end

    def update
      @shop = Shop.find(params[:id])
      @shop.update(check_params)
      redirect_to shop_path(@shop)
    end

    def destroy
      @shop =   Shop.find(params[:id])
      @shop.destroy
      redirect_to shops_path

    end

private

      def check_params
        params.require(:shop).permit(:user_id, :sneaker_id)
      end

end
