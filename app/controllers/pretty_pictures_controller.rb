class PrettyPicturesController < ApplicationController
  def home
    redirect_to login_path unless logged_in?
    redirect_to connect_path unless @current_user.connected_to_500px?
  end
end
