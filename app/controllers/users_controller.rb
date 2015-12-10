class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render 'show', @user.id
    else
      render 'new'
    end
  end

  def login
  end

  def show
    @user= User.find(params[:id])
  end

  private
    def user_params
      params.require(:user).permit(
        :username, :password, :password_confirmation, :bio)
    end
end
