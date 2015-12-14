class PhotosController < ApplicationController
  def show
    adaptor = FiveHundredPxAdaptor.new(current_user)
    @photo = adaptor.get_photo(params[:id])
  end

  def update
    redirect_to photos_path
  end
end
