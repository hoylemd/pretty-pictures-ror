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
    redirect_to home_path if @current_user.connected_to_500px?
  end

  def create_connection
    redirect_to login_path unless logged_in?

    adaptor = FiveHundredPxAdaptor.new()
    access_token = adaptor.get_user_access_token(connect_params)

    @current_user.oauth_token = access_token.token
    @current_user.oauth_secret = access_token.secret
    @current_user.save!(validate: false)

    redirect_to home_path
  end

  def disconnect
    redirect_to login_path unless logged_in?

    @current_user.oauth_token = nil
    @current_user.oauth_secret = nil
    @current_user.save!(validate: false)

    redirect_to home_path
  end

  private
    def user_params
      params.require(:user).permit(
        :username, :password, :password_confirmation, :bio)
    end

    def connect_params
      return {
        username:params.require(:username),
        password: params.require(:password)
      }
    end
end
