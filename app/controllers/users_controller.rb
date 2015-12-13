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

    access_token = get_access_token(fivehundredpx_params)

    @current_user.oauth_token = access_token.token
    @current_user.oauth_secret = access_token.secret
    @current_user.save!(validate: false)

    redirect_to home_path
  end

  def destroy_connection
    redirect_to login_path unless logged_in?
  end

  private
    def user_params
      params.require(:user).permit(
        :username, :password, :password_confirmation, :bio)
    end

    def fivehundredpx_params
      return {
        username:params.require(:username),
        password: params.require(:password)
      }
    end

    BASE_URL = 'https://api.500px.com'
    CONSUMER_KEY = 'qAONVEkKAQlbJBnyXXRmJdRN85QCfxxQlJQOjNzQ'
    CONSUMER_SECRET = 'bwdE2F4GiGwVHDrccstzdq4CPsi6q91OSdhrGcMs'

    # This is blatantly copied from the example apps in the 500px API docs
    # well, with some of my own style changes
    def get_access_token(credentials)
      site_hash = {
        site: BASE_URL,
        request_token_path: "/v1/oauth/request_token",
        access_token_path: "/v1/oauth/access_token",
        authorize_path: "/v1/oauth/authorize"
      }

      consumer = OAuth::Consumer.new(CONSUMER_KEY, CONSUMER_SECRET, site_hash)

      auth_hash = {
        x_auth_mode: 'client_auth',
        x_auth_username: credentials[:username],
        x_auth_password: credentials[:password]
      }

      request_token = consumer.get_request_token()
      consumer.get_access_token(request_token, {}, auth_hash)
    end
end
