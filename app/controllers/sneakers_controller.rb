class SneakersController < ApplicationController

  def index
    @sneakers = Sneaker.all
  end

  def show
    @sneaker = Sneaker.find(params[:id])
  end

  def new
    @sneaker = Sneaker.new
  end

  def create
    @sneaker = Sneaker.create(params.require(:sneaker).permit(:style, :color, :size))

    if @sneaker.save
      redirect_to @sneaker
    else
      render "new"
    end
  end

  def edit
    @sneaker = Sneaker.find(params[:id])
  end

  def update
    @sneaker = Sneaker.find(params[:id])
    @sneaker.update(params.require(:sneaker).permit(:style, :color, :size))
    redirect_to sneaker_path(@sneaker)
  end

  def destroy
    @sneaker = Sneaker.find(params[:id])
    @sneaker.destroy
    redirect_to sneakers_path
  end

end
