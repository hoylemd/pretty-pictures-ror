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
    # accept 500px un/pw
    # request the token/secret
    # store them
    # redirect to home
  end

  def destroy_connection
    # send revoke request
    # remove token/secret from user model
  end

  private
    def user_params
      params.require(:user).permit(
        :username, :password, :password_confirmation, :bio)
    end
end
