class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(params.require(:user).permit(:name))

    if @user.save
      redirect_to @user
    else
      render "new"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(params.require(:user).permit(:name))
    redirect_to user_path(@user)
  end

  def destroy

    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

end
