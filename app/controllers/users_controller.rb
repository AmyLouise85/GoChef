class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @users = User.all
    if user_signed_in? 
      render 'index'
    else
      render 'home'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    if current_user.id == params[:id].to_i
      @user = User.find(params[:id])
    else
      redirect_to '/'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render 'show'
    else
      p @user
      render 'edit'
    end   
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :bio, :location_lat, :location_lon, :avatar)
    end
  
end
