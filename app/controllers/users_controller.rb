class UsersController < ApplicationController
  def new
  end
  def login
  end
  def show
    @user= User.find(params[:id])
  end
end
