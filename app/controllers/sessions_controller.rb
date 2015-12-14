class SessionsController < ApplicationController
  def new
    redirect_to root_path if logged_in?
    @hide_user_header = true
  end

  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      message = "You are logged in. Welcome, #{user.username}"
      flash[:success] = message
      redirect_to user
    else
      message = 'Oops, looks like your username or password are incorrect.'
      flash.now[:danger] = message
      render 'new'
    end
  end

  def destroy
    log_out()
    redirect_to login_path
  end
end
