require 'rails_helper'

RSpec.describe "StartPages", type: :request do

  describe "GET /home" do
    it "returns http success" do
      get "/start_page/home"
      expect(response).to have_http_status(:success)
    end
  end

end
