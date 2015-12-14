class PhotosController < ApplicationController
  def show
    adaptor = FiveHundredPxAdaptor.new(current_user)
    @photo = adaptor.get_photo(params[:id])
  end

  def update
    redirect_to photo_path(params[:id])
  end
end
