class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      message = "You are logged in. Welcome, #{user.username}"
      flash[:success] = message
      redirect_to home_path
    else
      message = 'Oops, looks like your username or password are incorrect.'
      flash.now[:danger] = message
      render 'new'
    end
  end

  def destroy
  end
end
