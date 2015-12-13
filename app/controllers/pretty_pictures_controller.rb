class PrettyPicturesController < ApplicationController
  def home
    redirect_to login_path unless logged_in?
    redirect_to connect_path unless @current_user.connected_to_500px?

    @api = build_api(@current_user.oauth_token, @current_user.oauth_secret)
  end
end
