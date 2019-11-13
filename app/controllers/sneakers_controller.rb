class SneakersController < ApplicationController
  before_action :set_sneaker, only: [:show, :edit, :update, :destroy]

  def index
    @sneakers = Sneaker.all
  end

  def show
    # set_sneaker
    # render :show
  end

  def new
    @sneaker = Sneaker.new
  end

  def create
    @sneaker = Sneaker.create(check_params)

    if @sneaker.save
      redirect_to @sneaker
    else
      render "new"
    end
  end

  def edit
    # set_sneaker
  end

  def update
    # set_sneaker
    @sneaker.update(check_params)
    redirect_to sneaker_path(@sneaker)
  end

  def destroy
    # set_sneaker
    @sneaker.destroy
    redirect_to sneakers_path
  end

  private

  def set_sneaker
    @sneaker = Sneaker.find(params[:id])
  end

  def check_params
    params.require(:sneaker).permit(:style, :color, :size)
  end



end
