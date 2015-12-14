class PhotosController < ApplicationController
  def show
    @id = params[:id]


  end

  def update
    redirect_to photos_path
  end
end
