class PrettyPicturesController < ApplicationController
  def home
    adaptor = FiveHundredPxAdaptor.new(current_user)
    @photos = adaptor.get_top_100
  end
end
