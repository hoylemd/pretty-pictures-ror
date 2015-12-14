require 'rails_helper'

RSpec.describe PhotosController, type: :controller do

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #like" do
    it "returns http success" do
      get :like
      expect(response).to have_http_status(:success)
    end
  end

end
