class PrettyPicturesController < ApplicationController
  def home
    if logged_in? && ! @current_user.connected_to_500px?
      redirect_to connect_path
    end

    adaptor = FiveHundredPxAdaptor.new(@current_user)
    @photos = adaptor.get_top_100
  end
end
