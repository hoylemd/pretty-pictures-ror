class PhotosController < ApplicationController
  def show
    adaptor = FiveHundredPxAdaptor.new(current_user)
    @photo = adaptor.get_photo(params[:id])
  end

  def update
    if logged_in?
      adaptor = FiveHundredPxAdaptor.new(current_user)
      resp = adaptor.post_vote(params[:id])
      if resp['status'] == 200
        flash[:success] = "Thanks! You liked this photo."
      elsif resp['status'] == 403 && resp['error_code'] == "already_voted"
        flash[:success] =
          "You've already liked this photo. I guess you like it a lot!"
      else
        flash[:danger] = "Sorry, something wrong: #{resp['error']}"
      end
    end
    redirect_to photo_path(params[:id])
  end
end
