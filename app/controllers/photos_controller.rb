class PhotosController < ApplicationController
  def show
    adaptor = FiveHundredPxAdaptor.new(current_user)
    @photo = adaptor.get_photo(params[:id])
  end

  def update
    if logged_in?
     adaptor = FiveHundredPxAdaptor.new(current_user)
     adaptor.post_vote(params[:id])
    end
    redirect_to photo_path(params[:id])
  end
end
