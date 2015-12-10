class UsersController < ApplicationController
  def new
  end
  def login
  end
  def show
    @user= User.find(params[:id])
    @connectied = @user.token.blank? or @user.secret.blank ? false : true
  end
end
