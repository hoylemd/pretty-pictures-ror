class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to Pretty Pictures!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    redirect_to login_path unless logged_in?
    @user= User.find(params[:id])
  end

  def connect
    redirect_to login_path unless logged_in?
  end

  def create_connection
    redirect_to login_path unless logged_in?

    @credentials = fivehundredpx_params

    #redirect_to home_path
  end

  def destroy_connection
    redirect_to login_path unless logged_in?
    # send revoke request
    # remove token/secret from user model
  end

  private
    def user_params
      params.require(:user).permit(
        :username, :password, :password_confirmation, :bio)
    end

    def fivehundredpx_params
      {
        username: params.require(:username),
        password: params.require(:password)
      }
    end
end
